#!/bin/bash

#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=6GB
#SBATCH --array=1-578
#SBATCH --time=12:00:00
#SBATCH --account=def-adagher

module load StdEnv/2020 gcc/9.3.0 ants/2.4.4

echo "Starting task ${SLURM_ARRAY_TASK_ID}"
DIR=$(sed -n "${SLURM_ARRAY_TASK_ID}p" subs_1)
cd /home/mtweed/scratch/tractoflow_hcp_dwi/results/$DIR

fixedImage="/home/mtweed/scratch/ants/mni_icbm152_t1_tal_nlin_sym_09c_resampled125.nii.gz"
movingImage_T1="/home/mtweed/scratch/tractoflow_hcp_dwi/results/${DIR}/N4_T1/${DIR}__t1_n4.nii.gz"
movingImages=("/home/mtweed/scratch/tractoflow_hcp_dwi/results/${DIR}/DTI_Metrics/${DIR}__ad.nii.gz"
    "/home/mtweed/scratch/tractoflow_hcp_dwi/results/${DIR}/DTI_Metrics/${DIR}__md.nii.gz"
    "/home/mtweed/scratch/tractoflow_hcp_dwi/results/${DIR}/DTI_Metrics/${DIR}__fa.nii.gz"
    "/home/mtweed/scratch/tractoflow_hcp_dwi/results/${DIR}/DTI_Metrics/${DIR}__rd.nii.gaz""
)

antsRegistrationSyN.sh -d 3 -f "$fixedImage" -m "$movingImage_T1" -o "${DIR}_"

for movingImage in "${movingImages[@]}"; do
    movingImage_type="${movingImage##*/}"
    movingImage_type="${movingImage_type%%.*}"
    antsApplyTransforms -d 3 -i $movingImage  -r $fixedImage -t ${DIR}_1Warp.nii.gz -t ${DIR}_0GenericAffine.mat -o "${movingImage_type}_mni_152_2009c_nlsym.nii.gz"
done
