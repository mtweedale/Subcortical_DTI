#!/bin/bash

module load StdEnv/2020 gcc/9.3.0 cuda/11.0 fsl/6.0.4 afni/23.1.08

# Define TractoFlow and resampled hypothalamus masks
SUBJ="/home/mtweed/scratch/tractoflow_hcp_dwi/results"
HYPO="/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_bin_resampled"

# Folder to store results
mkdir -p subject_rois_bin
cd subject_rois_bin

# Iterate through each subject
for subj in "$SUBJ"/*; do
    subj_name="${subj##*/}"
    subj_name="${subj_name%%.*}"
	# Iterate through each ROI of the hypothalamus
	for hypo in "$HYPO"/*; do
	    hypo_roi="${hypo##*/}"
	    hypo_roi="${hypo_roi%%.*}"
	    if [[ $hypo == *.nii ]]; then
		cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_bin"
		mkdir -p ${subj_name}
		cd $subj_name
		# Create folder for each DTI for each subject
		mkdir -p ad_rois
		mkdir -p fa_rois
		mkdir -p md_rois
		mkdir -p rd_rois
		# Enter necessary folder and multiply subject data with ROI
		cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_bin/${subj_name}/ad_rois"
		fslmaths "${subj}/${subj_name}__ad_mni_152_2009c_nlsym.nii.gz" -mul "$hypo" "${subj_name}_ad_${hypo_roi}.nii.gz"
    		cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_bin/${subj_name}/fa_rois"
		fslmaths "${subj}/${subj_name}__fa_mni_152_2009c_nlsym.nii.gz" -mul "$hypo" "${subj_name}_fa_${hypo_roi}.nii.gz" 
    		cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_bin/${subj_name}/md_rois"
		fslmaths "${subj}/${subj_name}__md_mni_152_2009c_nlsym.nii.gz" -mul "$hypo" "${subj_name}_md_${hypo_roi}.nii.gz"
		cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_bin/${subj_name}/rd_rois"
    		fslmaths "${subj}/${subj_name}__rd_mni_152_2009c_nlsym.nii.gz" -mul "$hypo" "${subj_name}_rd_${hypo_roi}.nii.gz"
        	fi
        done
done
