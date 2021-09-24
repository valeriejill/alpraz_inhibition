import nibabel as nb
import numpy as np 
import scipy as sp 
import pandas as pd 
import glob
import os
import sys
import warnings
if not sys.warnoptions:
    warnings.simplefilter("ignore")
    
for session in sorted(glob.glob('/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/BIDS/*/*')):
 
    # define subid, sesid, and ses variables
    subid=session[65:-11]
    sesid=session[-10:]
    ses=sesid[-5:]
    
    # get TR length and number
    img = nb.load('/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/fmriprep/fmriprep/{0}/{1}/func/{0}_{1}_task-emotionid_space-MNI152NLin6Asym_res-2_desc-preproc_bold.nii.gz'.format(subid,sesid))
    TR = img.header.get_zooms()[-1]
    coln = img.shape[-1]
    
    # create empty taskarray to save deconvolved HRF task signals to for neutral, angry, fear, sad, and happy conditions
    taskarray = np.empty(shape=(210,0))
    
    # read in each azid_subj${emotion}_3col.txt file
    dir = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/{0}/{1}".format(subid,sesid)
    for file in sorted(os.listdir(dir)):
        if file.startswith('{0}_azid_subj'.format(ses)):

            # real time for each timepoint 
            nTRs = np.linspace(0, (coln-1)*TR, coln)

            # initializes timespoint and correponing weight
            # weight is zeros for all time point initially
            hk = np.zeros([coln,2])
            hk[:,0] = nTRs
            dd =  pd.read_csv('/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/{0}/{1}/{2}'.format(subid,sesid,file),header=None,delimiter='  ')

            # get the task file and convert event to serial (from block)
            serialtime = []
            for j in range(0,len(dd)):
                serialtime.append(dd[0][j]) # add start of stimulus
                nn = np.int(np.round(dd[1][j]/TR)) # get number of timepoints between blocks
                if nn > 0: 
                    for i in range(1,nn+1):
                        serialtime.append(dd[0][j] + i*TR) # add timepoints between blocks if any

            # mark the stimulus time  
                for j in serialtime:
                    # indxxx = np.int(np.where(hk[:,0] == j)[0])
                    indxxy = np.where(hk[:,0] >= j)[0]
                    indxxx = np.int(indxxy[0])
                    hk[indxxx,1]=1 # each event timepoints is now 1 otherwise remains zerosent timepoints is now 1 otherwise remains zeros

            # hrf
            from scipy.stats import gamma
            def hrf(times):
                """ Return values for HRF at given times """
                 # Gamma pdf for the peak
                peak_values = gamma.pdf(times, 6)
                 # Gamma pdf for the undershoot
                undershoot_values = gamma.pdf(times, 12)
                 # Combine them
                values = peak_values - 0.35 * undershoot_values
                 # Scale max to 0.6
                return values / np.max(values) * 0.6

            # compute HRF with the signal
            hrf_times = np.arange(0, 35, TR)
            hrf_signal = hrf(hrf_times)
            N=len(hrf_signal)-1
            tt=np.convolve(hk[:,1],hrf_signal)
            realt=tt[:-N] # this is what we need actually

            # combine realt deconvolved signals for each task condition in one array
            taskarray = np.column_stack((taskarray, realt))
            df = pd.DataFrame(taskarray)   
    # save taskarray to custom task regression confounds .tsv file
    print("saving file for {0} and {1}".format(subid,sesid))
    df.to_csv("/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/{0}_{1}_task-emotionid_desc-custom_timeseries.tsv".format(subid,sesid),index = False,header=False,sep=' ')
