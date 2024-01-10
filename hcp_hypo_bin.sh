#!/bin/bash

module load StdEnv/2020 gcc/9.3.0 cuda/11.0 fsl/6.0.4 afni/23.1.08

SUBJ="/home/mtweed/scratch/tractoflow_hcp_dwi/results"
HYPO="/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_bin_resampled"

mkdir -p subject_rois_bin
cd subject_rois_bin

for subj in "$SUBJ"/*; do
    subj_name="${subj##*/}"
    subj_name="${subj_name%%.*}"
    if ((subj_name > 379657)); then
	for hypo in "$HYPO"/*; do
	    hypo_roi="${hypo##*/}"
	    hypo_roi="${hypo_roi%%.*}"
	    if [[ $hypo == *.nii ]]; then
		cd "/home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_bin"
		mkdir -p ${subj_name}
		cd $subj_name
		mkdir -p ad_rois
		mkdir -p fa_rois
		mkdir -p md_rois
		mkdir -p rd_rois
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
    fi	
done
