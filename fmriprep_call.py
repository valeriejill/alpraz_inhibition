import sys
import os

subid = sys.argv[1] #sys.argv[0] is the name of the script, sys.argv[1] is the first command line argument entered

cmd = 'singularity run  --cleanenv -B /cbica/projects/spatiotemp_dev_plasticity:/mnt /cbica/projects/spatiotemp_dev_plasticity/software/fmriprep_20.2.3.simg /mnt/Inhibition/Alpraz/BIDS /mnt/Inhibition/Alpraz/fmriprep participant -w /mnt/work  --n_cpus 1 --stop-on-first-crash --fs-license-file /mnt/software/license.txt --skip-bids-validation --output-spaces MNI152NLin6Asym:res-2 --participant-label {0} --force-bbr --cifti-output 91k -v -v'.format(subid) #the first argument in format() will replace all instances of {0}

os.system(cmd) #execute the fmriprep singularity call command

