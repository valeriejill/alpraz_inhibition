ANALYSIS SCRIPTS (In order of execution)
1. getBIDS_fwtocubic.sh
2. build_fmriprep20.2.3_singularityimage.sh
3. run_fmriprep_20.2.3.py + fmriprep_call.py
4. gettaskfiles_fwtocubic.sh
5. taskregression_hrf_signaldeconvolution.py
6. build_xcpabcd0.0.4_singularityimage.sh
7. run_xcpabcd_taskreg_surface.py + xcpabcd_taskreg_surface_call.py
8. catch22_tsfeatures.Rmd

CATCH22 SCRIPTS  - vertex data (In order of execution)
1. catch22_tsfeatures.Rmd
2. catch22_groupmask.Rmd
3. catch22_averagemaps.Rmd
4. catch22_averagemaps_visualization.Rmd
5. catch22_pca_preparedata.R
6. catch22_pca.Rmd

CATCH22 SCRIPTS - parcel data (In order of execution)


QC SCRIPTS
- qc_measures.R
- compare_hrf_customvfeat.R
- fs_euler_checker.py
- euler_plot.Rmd
