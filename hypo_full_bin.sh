#!/bin/bash

module load StdEnv/2020 gcc/9.3.0 cuda/11.0 fsl/6.0.4 afni/23.1.08
HYPOS="/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_atlas_bin_resampled_low_thr"

cp "/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_atlas_bin_low_thr/anterior_commissure_lh_bin.nii.gz" "/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_full_bin.nii.gz"

for hypo_roi in $HYPOS/*; do
    HYPO_ROI="${hypo_roi##*/}"
    HYPO_ROI="${HYPO_ROI%%.*}"
    fslmaths hypo_full_bin.nii.gz -add $HYPOS/${HYPO_ROI}.nii hypo_full_bin.nii.gz
done
fslmaths hypo_full_bin.nii.gz -bin hypo_full_bin.nii.gz
