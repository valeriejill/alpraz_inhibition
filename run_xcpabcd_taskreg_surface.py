import os
import glob

def submit_job(scipt_path,name,RAM=32,threads=1): #create a function for submitting jobs that takes 4 inputs
	"""
	submit an sge job
	"""
	sgedir = os.path.expanduser('/cbica/projects/spatiotemp_dev_plasticity/software/qsub_logs') #define the path for qsub log files 
	if os.path.isdir(sgedir) == False:
		os.system('mkdir {0}'.format(sgedir)) #mkdir log directory 
	command='qsub -l h_vmem={0}G,s_vmem={0}G -pe threaded {1}\
	 -N {2} -V -j y -b y -o /cbica/projects/spatiotemp_dev_plasticity/software/qsub_logs/{2}.xcpabcd.taskreg.surface.log.o -e /cbica/projects/spatiotemp_dev_plasticity/software/qsub_logs/{2}.xcpabcd.taskreg.surface.log.e python {3}'.format(RAM,threads,name,scipt_path) #fill in qsub command with mem (RAM), cores (threads), subid(name), and script to run (script_path)

	os.system(command)
    
#submit xcpabcd jobs for all subjects
dir = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/BIDS"

for subid in sorted(os.listdir(dir)):
    if subid.startswith('sub') and os.path.isdir('/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/fmriprep/fmriprep/{0}'.format(subid)) and not os.path.isdir('/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/xcpabcd/task_regress/surface/xcp_abcd/{0}'.format(subid)):
        submit_job('/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/scripts/xcpabcd_taskreg_surface_call.py {0}'.format(subid),'{0}'.format(subid))
