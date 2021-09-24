library(ciftiTools)
ciftiTools.setOption('wb_path', '/Users/valeriesydnor/Software/workbench/')

participants <- read.csv("/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/sub_ses_passQC_finallist.csv", header = FALSE)

catch1 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch2 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch3 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch4 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch5 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch6 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch7 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch8 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch9 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch10 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch11 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch12 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch13 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch14 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch15 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch16 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch17 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch18 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch19 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch20 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch21 <- matrix(NA, ncol=59412, nrow=nrow(participants))
catch22 <- matrix(NA, ncol=59412, nrow=nrow(participants))

for(row in c(1:nrow(participants))){
  subid=participants[row,1]
  sesid=participants[row,2]
  cifti.path = sprintf("/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/%1$s/%2$s/%1$s_%2$s_catch22_tsfeatures_masked.dscalar.nii", subid, sesid)
  xii <- read_xifti(cifti.path)
  
  #catch1
  lh.data <- t(xii$data$cortex_left[,1])
  rh.data <- t(xii$data$cortex_right[,1])
  cortex.data <- cbind(lh.data, rh.data)
  catch1[row,] <- cortex.data
  
  #catch2
  lh.data <- t(xii$data$cortex_left[,2])
  rh.data <- t(xii$data$cortex_right[,2])
  cortex.data <- cbind(lh.data, rh.data)
  catch2[row,] <- cortex.data
  
  #catch3
  lh.data <- t(xii$data$cortex_left[,3])
  rh.data <- t(xii$data$cortex_right[,3])
  cortex.data <- cbind(lh.data, rh.data)
  catch3[row,] <- cortex.data
  
  #catch4
  lh.data <- t(xii$data$cortex_left[,4])
  rh.data <- t(xii$data$cortex_right[,4])
  cortex.data <- cbind(lh.data, rh.data)
  catch4[row,] <- cortex.data
  
  #catch5
  lh.data <- t(xii$data$cortex_left[,5])
  rh.data <- t(xii$data$cortex_right[,5])
  cortex.data <- cbind(lh.data, rh.data)
  catch5[row,] <- cortex.data
  
  #catch6
  lh.data <- t(xii$data$cortex_left[,6])
  rh.data <- t(xii$data$cortex_right[,6])
  cortex.data <- cbind(lh.data, rh.data)
  catch6[row,] <- cortex.data
  
  #catch7
  lh.data <- t(xii$data$cortex_left[,7])
  rh.data <- t(xii$data$cortex_right[,7])
  cortex.data <- cbind(lh.data, rh.data)
  catch7[row,] <- cortex.data  
  
  #catch8
  lh.data <- t(xii$data$cortex_left[,8])
  rh.data <- t(xii$data$cortex_right[,8])
  cortex.data <- cbind(lh.data, rh.data)
  catch8[row,] <- cortex.data
  
  #catch9
  lh.data <- t(xii$data$cortex_left[,9])
  rh.data <- t(xii$data$cortex_right[,9])
  cortex.data <- cbind(lh.data, rh.data)
  catch9[row,] <- cortex.data
  
  #catch10
  lh.data <- t(xii$data$cortex_left[,10])
  rh.data <- t(xii$data$cortex_right[,10])
  cortex.data <- cbind(lh.data, rh.data)
  catch10[row,] <- cortex.data
  
  #catch11
  lh.data <- t(xii$data$cortex_left[,11])
  rh.data <- t(xii$data$cortex_right[,11])
  cortex.data <- cbind(lh.data, rh.data)
  catch11[row,] <- cortex.data
  
  #catch12
  lh.data <- t(xii$data$cortex_left[,12])
  rh.data <- t(xii$data$cortex_right[,12])
  cortex.data <- cbind(lh.data, rh.data)
  catch12[row,] <- cortex.data
  
  #catch13
  lh.data <- t(xii$data$cortex_left[,13])
  rh.data <- t(xii$data$cortex_right[,13])
  cortex.data <- cbind(lh.data, rh.data)
  catch13[row,] <- cortex.data
  
  #catch14
  lh.data <- t(xii$data$cortex_left[,14])
  rh.data <- t(xii$data$cortex_right[,14])
  cortex.data <- cbind(lh.data, rh.data)
  catch14[row,] <- cortex.data
  
  #catch15
  lh.data <- t(xii$data$cortex_left[,15])
  rh.data <- t(xii$data$cortex_right[,15])
  cortex.data <- cbind(lh.data, rh.data)
  catch15[row,] <- cortex.data
  
  #catch16
  lh.data <- t(xii$data$cortex_left[,16])
  rh.data <- t(xii$data$cortex_right[,16])
  cortex.data <- cbind(lh.data, rh.data)
  catch16[row,] <- cortex.data
  
  #catch17
  lh.data <- t(xii$data$cortex_left[,17])
  rh.data <- t(xii$data$cortex_right[,17])
  cortex.data <- cbind(lh.data, rh.data)
  catch17[row,] <- cortex.data
  
  #catch18
  lh.data <- t(xii$data$cortex_left[,18])
  rh.data <- t(xii$data$cortex_right[,18])
  cortex.data <- cbind(lh.data, rh.data)
  catch18[row,] <- cortex.data
  
  #catch19
  lh.data <- t(xii$data$cortex_left[,19])
  rh.data <- t(xii$data$cortex_right[,19])
  cortex.data <- cbind(lh.data, rh.data)
  catch19[row,] <- cortex.data
  
  #catch20
  lh.data <- t(xii$data$cortex_left[,20])
  rh.data <- t(xii$data$cortex_right[,20])
  cortex.data <- cbind(lh.data, rh.data)
  catch20[row,] <- cortex.data
  
  #catch21
  lh.data <- t(xii$data$cortex_left[,21])
  rh.data <- t(xii$data$cortex_right[,21])
  cortex.data <- cbind(lh.data, rh.data)
  catch21[row,] <- cortex.data
  
  #catch22
  lh.data <- t(xii$data$cortex_left[,22])
  rh.data <- t(xii$data$cortex_right[,22])
  cortex.data <- cbind(lh.data, rh.data)
  catch22[row,] <- cortex.data
  
  rm(lh.data)
  gc()
  rm(rh.data)
  gc()
  rm(cortex.data)
  gc()
  rm(xii)
  gc()
}

saveRDS(catch1, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch1.subxvertex.matrix.Rdata")
saveRDS(catch2, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch2.subxvertex.matrix.Rdata")
saveRDS(catch3, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch3.subxvertex.matrix.Rdata")
saveRDS(catch4, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch4.subxvertex.matrix.Rdata")
saveRDS(catch5, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch5.subxvertex.matrix.Rdata")
saveRDS(catch6, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch6.subxvertex.matrix.Rdata")
saveRDS(catch7, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch7.subxvertex.matrix.Rdata")
saveRDS(catch8, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch8.subxvertex.matrix.Rdata")
saveRDS(catch9, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch9.subxvertex.matrix.Rdata")
saveRDS(catch10, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch10.subxvertex.matrix.Rdata")
saveRDS(catch11, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch11.subxvertex.matrix.Rdata")
saveRDS(catch12, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch12.subxvertex.matrix.Rdata")
saveRDS(catch13, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch13.subxvertex.matrix.Rdata")
saveRDS(catch14, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch14.subxvertex.matrix.Rdata")
saveRDS(catch15, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch15.subxvertex.matrix.Rdata")
saveRDS(catch16, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch16.subxvertex.matrix.Rdata")
saveRDS(catch17, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch17.subxvertex.matrix.Rdata")
saveRDS(catch18, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch18.subxvertex.matrix.Rdata")
saveRDS(catch19, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch19.subxvertex.matrix.Rdata")
saveRDS(catch20, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch20.subxvertex.matrix.Rdata")
saveRDS(catch21, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch21.subxvertex.matrix.Rdata")
saveRDS(catch22, file = "/cbica/projects/spatiotemp_dev_plasticity/Inhibition/Alpraz/catch22/pca/catch22.subxvertex.matrix.Rdata")

  
