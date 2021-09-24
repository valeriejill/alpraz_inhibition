import sys
import os

subid = sys.argv[1]

cmd = 'singularity run  --cleanenv -B /cbica/projects/spatiotemp_dev_plasticity:/mnt /cbica/projects/spatiotemp_dev_plasticity/software/xcpabcd_0.0.4.simg /mnt/Inhibition/Alpraz/fmriprep/fmriprep /mnt/Inhibition/Alpraz/xcpabcd/task_regress/surface participant --despike --lower-bpf 0.01 --upper-bpf 0.08 --participant_label {0} -p 36P -f 10 -t emotionid -c /mnt/Inhibition/Alpraz/task_files/ -w /mnt/work --cifti'.format(subid)
 
os.system(cmd)
