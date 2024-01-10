#!/bin/bash

module load StdEnv/2020 gcc/9.3.0 cuda/11.0 fsl/6.0.4 afni/23.1.08

SUBJ="/home/mtweed/scratch/tractoflow_hcp_dwi/results"
HYPO="/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_bin_resampled_high_thr"

mkdir -p subject_rois_high_thr

for subj in "$SUBJ"/*; do
    subj_name="${subj##*/}"
    subj_name="${subj_name%%.*}"
    for hypo in "$HYPO"/*; do
	hypo_roi="${hypo##*/}"
	hypo_roi="${hypo_roi%%.*}"
	if [[ $hypo  == *.nii ]]; then
	    cd /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_high_thr/${subj_name}
	    mkdir -p rd_rois
	    cd rd_rois
	    fslmaths "${subj}/${subj_name}__rd_mni_152_2009c_nlsym.nii.gz" -mul "$hypo" "${subj_name}_rd_${hypo_roi}.nii.gz" 
	fi
    done
done
