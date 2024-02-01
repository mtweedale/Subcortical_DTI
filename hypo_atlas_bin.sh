#!/bin/bash

module load StdEnv/2020 gcc/9.3.0 cuda/11.0 fsl/6.0.4 afni/23.1.08

# Define paths for left and right hemispheres for hypothalamus atlas
HYPO_L="/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_atlas/lh"
HYPO_R="/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_atlas/rh"

cd "/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_atlas_bin"
# Iterate through left hemisphere ROIs
for hypo in $HYPO_L/*; do
    HYPO_ROI="${hypo##*/}"
    HYPO_ROI="${HYPO_ROI%%.*}"
    # Binarize the mask
    fslmaths "$hypo" -bin "${HYPO_ROI}_lh.nii.gz"
done
#Iterate through right hemisphere ROIs
for hypo in $HYPO_R/*; do
    HYPO_ROI="${hypo##*/}"
    HYPO_ROI="${HYPO_ROI%%.*}"
    # Binarize the mask
    fslmaths "$hypo" -bin "${HYPO_ROI}_rh.nii.gz"
done
