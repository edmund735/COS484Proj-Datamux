#!/bin/bash
#SBATCH --job-name=NERn1     # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=4G         # memory per cpu-core
#SBATCH --gres=gpu:1             # number of gpus per node
#SBATCH --time=24:00:30          # total run time limit (HH:MM:SS)
#SBATCH --constraint=a100        # choose a100 or v100
#SBATCH --mail-type=all          # send email when job begins, ends and fails
#SBATCH --mail-user=efyoung@princeton.edu



module purge
module load anaconda3/2022.10
conda activate datamux

sh run_ner.sh \
   -N 1 \
   -d index \
   -m gaussian_hadamard \
   -s finetuning \
   --config_name configs/ablations/base_model/roberta.json \
   --lr 5e-5 \
   --task ner \
   --model_path princeton-nlp/datamux-retrieval-2 \
   --do_train \
   --do_eval 

