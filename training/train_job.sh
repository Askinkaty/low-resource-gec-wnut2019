#!/usr/bin/env bash

#SBATCH --account=project_2002016
#SBATCH --job-name=low_train


#SBATCH --partition=gpu

#SBATCH --cpus-per-task=8
#SBATCH --mem=80G
#SBATCH --ntasks=1
#SBATCH --time=48:00:00
#SBATCH --gres=gpu:v100:3

module load gcc/8.3.0 cuda/11.0

export DIR=/projappl/project_2002016/low-resource-gec-wnut2019/training
cd $DIR



conda activate low



if [[ "${LD_LIBRARY_PATH}" != "" ]]
then
export LD_LIBRARY_PATH=/scratch/project_2002016/miniconda3/envs/low/lib:${LD_LIBRARY_PATH}
else
export LD_LIBRARY_PATH=/scratch/project_2002016/miniconda3/envs/low/lib

fi

echo $LD_LIBRARY_PATH
srun ./run_training.sh
