#!/bin/bash

module load StdEnv/2020 gcc/9.3.0 cuda/11.0 fsl/6.0.4 afni/23.1.08

# Define paths to non-hypothalamus ROIs and template image
ROIS="/home/mtweed/scratch/tractoflow_hcp_dwi/other_rois"
correct_dims_img="/home/mtweed/scratch/ants/mni_icbm152_t1_tal_nlin_sym_09c_resampled125.nii.gz"

mkdir -p other_rois_resampled
cd "/home/mtweed/scratch/tractoflow_hcp_dwi/other_rois_resampled"

# Iterate through ROIs
for ROI in $ROIS/*; do
    roi="${ROI##*/}"
    roi="${roi%%.*}"
    roi_resampled="${roi}_resampled"
    # Resample current ROI to template image
    3dresample -master "${correct_dims_img}" -prefix "$roi_resampled" -input ${ROI}
    3dAFNItoNIFTI -prefix "${roi_resampled}" "${roi_resampled}+tlrc.BRIK"
done

mv *.BRIK /home/mtweed/scratch/tractoflow_hcp_dwi/rois_BRIK_HEAD/other_rois_BRIK_HEAD_bin/
mv *.HEAD /home/mtweed/scratch/tractoflow_hcp_dwi/rois_BRIK_HEAD/other_rois_BRIK_HEAD_bin/

