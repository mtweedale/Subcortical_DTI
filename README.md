# Subcortical_DTI

#Extracted HCP non-zero values for the hypothalamus ROIs
#HCP_ad_bin.ipynb
#HCP_fa_bin.ipynb
#HCP_md_bin.ipynb
#HCP_rd_bin.ipynb

#Extracted HCP non-zero values for the caudate, hippocampus, nucleus accumbens, pallidum, and putamen
#other_rois_fa.ipynb 
#other_rois_ad.ipynb 
#other_rois_md.ipynb 
#other_rois_rd.ipynb 

#ANTs Registration and Transformation of DTI Metrics to MNI-152
#ants_1.sh
#ants_2.sh

#Download HCP data
#download_hcp.sh

#Run TractoFlow on HCP data
#tractoflow.sh

#Binarize Hypothalamus Atlas ROIs
#hypo_atlas_bin.sh

#Resample Hypothalamus and additional ROIs to fit MNI-152
#hypo_bin_resampled.sh
#other_rois_resampled.sh

#Multiply Hypo and non-hypo ROIs with FA, MD, AD, and RD and binarize
#hcp_hypo_bin.sh
#hcp_other_rois.sh

#Multiple hypothalamus ROIs calculated with high and low thresholds rather than being binarized (not used in paper)
#hcp_hypo_high_thr.sh
#hcp_hypo_low_thr.sh

#Calculate regressions for HCP and plot radar charts
#analyze_HCP.ipynb

#Analysis of UKBB Data into Summary Table for ROIs
#analyze_UKBB.ipynb

#Creation of Radar Charts for UKBB Data
#spiderplots_UKBB.ipynb

#Calculate regressions for UKBB and HCP hypothalamic data
#scatter_plots_UKBB.ipynb
#scatter_plots_HCP_bin.ipynb

#Calculate regressions for HCP non-binarized hypothalamic data
#scatter_plots_HCP.ipynb

