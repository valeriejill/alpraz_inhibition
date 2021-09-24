
#when logged in to fw via fw login $API

cd /cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/BIDS
for subject in sub*; do
mkdir /cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/$subject 
sub=${subject#*-}
cd $subject
	for session in *; do
	mkdir /cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/$subject/$session
	ses=${session#*-}
	sesid=${ses#*0}
	fw download bbl/ALPRAZ_805556/$sub/$ses/files/${sesid}_task.zip -o /cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/$subject/$session/${subject}-${session}_task.zip
	done
cd ..
done

cd /cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/
for subject in sub*; do
cd $subject
	for session in *; do
	cd $session
	unzip *task.zip
	cd ../
	done
cd ..
done


