TRANSLATE='gpu'
NUM_GPUS=1

MODEL=transformer
MODEL_TYPE=transformer_base_single_gpu

MODEL_PATH=/scratch/project_2002016/t2t_train/finetune_general_problem-ru-finetune-tep0.15-ted0.65_0.1_0.1_0.1_0.05-cep0.02-ced0.25_0.25_0.25_0.25_0/transformer-transformer_base_single_gpu-iwdr0.2-twdr0.1-ew3-ws10000-lrc1-aap2000000-awp0-adfFalse-ratio1

EXPERIMENT_ROOT_DIR=/projappl/project_2002016/low-resource-gec-wnut2019/training
DATA_ROOT_DIR=/scratch/project_2002016

PROBLEM=translate_inc_cor
PROBLEM_DIR=$EXPERIMENT_ROOT_DIR/problems/
TRAIN_DIR=$EXPERIMENT_ROOT_DIR/t2t_train # path to root folder where to store model checkpoints
DATA_DIR=$EXPERIMENT_ROOT_DIR/t2t_data # path to root folder where to generate training data

VOCAB_PATH=${DATA_DIR}/finetune_general_problem-ru-finetune-tep0.15-ted0.65_0.1_0.1_0.1_0.05-cep0.02-ced0.25_0.25_0.25_0.25_0-aap2000000-awp0-adfFalse-ratio1/vocab.finetune_general_problem.32768.subwords

BATCH_SIZE=2048
MAX_LEN=150

# decoding (Tensorboard)
BEAM_SIZE=4
ALPHA=0.6

LANG="ru"

# technical stuff
NO_EDIT_DATA_DIR=${DATA_DIR}/$PROBLEM-$LANG
DATA_DIR=${NO_EDIT_DATA_DIR}
INPUT_FILE=/scratch/project_2002016/datasets/data-gec/clang8rulecrl/valid.src
OUTPUT_FILE=${NO_EDIT_DATA_DIR}
