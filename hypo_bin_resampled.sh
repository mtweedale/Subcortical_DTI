#!/bin/bash

module load StdEnv/2020 gcc/9.3.0 cuda/11.0 fsl/6.0.4 afni/23.1.08

HYPO="/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_atlas_bin"
correct_dims_img="/home/mtweed/scratch/ants/mni_icbm152_t1_tal_nlin_sym_09c_resampled125.nii.gz"

cd "/home/mtweed/scratch/tractoflow_hcp_dwi/hypo_bin_resampled"

for hypo_roi in $HYPO/*; do
    HYPO_ROI="${hypo_roi##*/}"
    HYPO_ROI="${HYPO_ROI%%.*}"
    roi_resampled="${HYPO_ROI}_resampled"
    3dresample -master "${correct_dims_img}" -prefix "$roi_resampled" -input ${hypo_roi}
    3dAFNItoNIFTI -prefix "${roi_resampled}" "${roi_resampled}+tlrc.BRIK"
done

mv *.BRIK /home/mtweed/scratch/tractoflow_hcp_dwi/hypo_rois_BRIK_HEAD/hypo_rois_BRIK_HEAD_bin/
mv *.HEAD /home/mtweed/scratch/tractoflow_hcp_dwi/hypo_rois_BRIK_HEAD/hypo_rois_BRIK_HEAD_bin/

