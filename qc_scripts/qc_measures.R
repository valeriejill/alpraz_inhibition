participants <- read.csv("/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/sub_ses_passQC_finallist.csv", header=F)

QC.table <- matrix(NA, ncol=6, nrow=nrow(participants))

for(row in c(1:nrow(participants))){
sub=participants[row,1]
ses=participants[row,2]

qcdata <- read.csv(sprintf("/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/xcpabcd/task_regress/surface/xcp_abcd/%1$s/%2$s/func/%1$s_%2$s_task-emotionid_space-fsLR_desc-qc_den-91k_bold.csv",sub,ses),header=T, sep=",")

if(qcdata$meanFD > 0.5)
result=c("fail")
else
result=c("pass")

QC.table[row,1] <- sprintf("%s", sub)
QC.table[row,2] <- sprintf("%s", ses)
QC.table[row,3] <- qcdata$meanFD
QC.table[row,4] <- qcdata$relMeansRMSMotion
QC.table[row,5] <- qcdata$relMaxRMSMotion
QC.table[row,6] <- result
}

colnames <- c("subid","sesid","meanFD","relMeansRMSMotion","relMaxRMSMotion","FDpass")
colnames(QC.table) <- colnames
write.csv(QC.table, file="/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/sub_ses_QC_metrics.csv",quote=F,row.names=F,col.names=T)
