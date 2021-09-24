participants <- read.csv("/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/sub_ses_list.csv", header=F)


regressor.correlations <- matrix(NA,ncol=5,nrow=nrow(participants))

for(row in c(1:nrow(participants))){
sub=participants[row,1]
ses=participants[row,2]

feat <- read.csv(sprintf("/cbica/projects/alpraz_EI/data/TASK_GSR/xcpengine/%1$s/%2$s/task-emotionid/space-MNI152NLin2009cAsym/task/fsl/%1$s_%2$s_task-emotionid_space-MNI152NLin2009cAsym.feat/design.mat",sub,ses),header=F, sep="\t")
feat <- feat[5:214,1:5]
custom <- read.csv(sprintf("/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/%1$s_%2$s_task-emotionid_desc-custom_timeseries.tsv",sub,ses),header=F,sep=" ")

angry=(cor.test(as.numeric(as.character(feat$V1)), custom$V1)$estimate)
fear=(cor.test(as.numeric(as.character(feat$V2)), custom$V2)$estimate)
happy=(cor.test(as.numeric(as.character(feat$V3)), custom$V3)$estimate)
neutral=(cor.test(as.numeric(as.character(feat$V4)), custom$V4)$estimate)
sad=(cor.test(as.numeric(as.character(feat$V5)), custom$V5)$estimate)

regressor.correlations[row,1] <- angry
regressor.correlations[row,2] <- fear
regressor.correlations[row,3] <- happy
regressor.correlations[row,4] <- neutral
regressor.correlations[row,5] <- sad
}

colnames <- c("angry","fear","happy","neutral","sad")
colnames(regressor.correlations) <- colnames

summary(regressor.correlations)

regressor.correlations

write.csv(regressor.correlations, file="/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/task_files/customvfeat_regressorcorrelations.csv",sep=",",quote=F,row.names=F,col.names=T)
