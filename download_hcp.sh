#!/bin/bash

subjectlist="subjects.txt"

# Download necessary HCP values from HCP using aws
while read -r subject;
do
    mkdir -p hcp/"$subject"
    aws s3 cp s3://hcp-openaccess/HCP_1200/"$subject"/T1w/Diffusion/bvals /home/mtweed/scratch/tractoflow/hcp/"$subject"/bval
    aws s3 cp s3://hcp-openaccess/HCP_1200/"$subject"/T1w/Diffusion/bvecs /home/mtweed/scratch/tractoflow/hcp/"$subject"/bvec
    aws s3 cp s3://hcp-openaccess/HCP_1200/"$subject"/T1w/Diffusion/data.nii.gz /home/mtweed/scratch/tractoflow/hcp/"$subject"/dwi.nii.gz
    aws s3 cp s3://hcp-openaccess/HCP_1200/"$subject"/T1w/T1w_acpc_dc_restore.nii.gz /home/mtweed/scratch/tractoflow/hcp/"$subject"/t1.nii.gz
    aws s3 cp s3://hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/aparc+aseg.nii.gz /home/mtweed/scratch/tractoflow/hcp/"$subject"/aparc+aseg.nii.gz
    aws s3 cp s3://hcp-openaccess/HCP_1200/"$subject"/MNINonLinear/wmparc.nii.gz /home/mtweed/scratch/tractoflow/hcp/"$subject"/wmparc.nii.gz

done <"$subjectlist"