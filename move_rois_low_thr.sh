#!/bin/bash

SUBJ="/home/mtweed/scratch/tractoflow_hcp_dwi/results"

for subj in "$SUBJ"/*; do
    subj_name="${subj##*/}"
    subj_name="${subj_name%%.*}"
    cd /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr
    mkdir -p $subj_name
    cd $subj_name
    mkdir -p ad_rois
    mkdir -p fa_rois
    mkdir -p md_rois
    mkdir -p rd_rois
    mv -v /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr/ad_rois/${subj_name}_* /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr/${subj_name}/ad_rois/
    mv -v /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr/fa_rois/${subj_name}_* /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr/${subj_name}/fa_rois/
    mv -v /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr/md_rois/${subj_name}_* /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr/${subj_name}/md_rois/
    mv -v /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr/rd_rois/${subj_name}_* /home/mtweed/scratch/tractoflow_hcp_dwi/subject_rois_low_thr/${subj_name}/rd_rois/
done
