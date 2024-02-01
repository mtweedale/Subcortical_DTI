#!/bin/bash

module load StdEnv/2020 gcc/9.3.0 cuda/11.0 fsl/6.0.4 afni/23.1.08

# Define variables for TractoFlow results and non-hypothalamus resampled masks
SUBJ="/home/mtweed/scratch/tractoflow_hcp_dwi/results"
ROIS="/home/mtweed/scratch/tractoflow_hcp_dwi/other_rois_resampled"

mkdir -p subject_other_rois
cd subject_other_rois

# Iterate through each subject
for subj in "$SUBJ"/*; do
    subj_name="${subj##*/}"
    subj_name="${subj_name%%.*}"
    # Iterate through each ROI
    for ROI in "$ROIS"/*; do
        roi="${ROI##*/}"
	roi="${roi%%.*}"
	if [[ $ROI == *.nii ]]; then
	    cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_other_rois"
	    mkdir -p ${subj_name}
	    cd $subj_name
	    mkdir -p ad_rois
	    mkdir -p fa_rois
	    mkdir -p md_rois
	    mkdir -p rd_rois
	    # Multiply the patient DTI NIfTI with ROI mask
	    cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_other_rois/${subj_name}/ad_rois"
	    fslmaths "${subj}/${subj_name}__ad_mni_152_2009c_nlsym.nii.gz" -mul "$ROI" "${subj_name}_ad_${roi}.nii.gz"
    	    cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_other_rois/${subj_name}/fa_rois"
	    fslmaths "${subj}/${subj_name}__fa_mni_152_2009c_nlsym.nii.gz" -mul "$ROI" "${subj_name}_fa_${roi}.nii.gz" 
    	    cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_other_rois/${subj_name}/md_rois"
	    fslmaths "${subj}/${subj_name}__md_mni_152_2009c_nlsym.nii.gz" -mul "$ROI" "${subj_name}_md_${roi}.nii.gz"
	    cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_other_rois/${subj_name}/rd_rois"
    	    fslmaths "${subj}/${subj_name}__rd_mni_152_2009c_nlsym.nii.gz" -mul "$ROI" "${subj_name}_rd_${roi}.nii.gz"
        fi
    done
done
