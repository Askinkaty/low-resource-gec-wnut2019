#!/usr/bin/env bash

TRANSLATE='gpu'
NUM_GPUS=3

INPUT_WORD_DROPOUT_RATE=0.2
TARGET_WORD_DROPOUT_RATE=0.1
EDIT_WEIGHT=3

MODEL=transformer
CHECKPOINT_PATH=/scratch/project_2002016/t2t_train/artificial_errors-ru-tep0.15-ted0.65_0.1_0.1_0.1_0.05-cep0.02-ced0.25_0.25_0.25_0.25_0/transformer-transformer_base_single_gpu-iwdr0.2-twdr0.1-ew3-ws10000-lrc1

MODEL_TYPE=transformer_base_single_gpu

EXPERIMENT_ROOT_DIR=/projappl/project_2002016/low-resource-gec-wnut2019/training # TODO set it yourself
DATA_ROOT_DIR=/scratch/project_2002016

PROBLEM=artificial_errors
PROBLEM_DIR=$EXPERIMENT_ROOT_DIR/problems/
TRAIN_DIR=$DATA_ROOT_DIR/t2t_train # path to root folder where to store model checkpoints
#TRAIN_DIR=$CHECKPOINT_PATH
DATA_DIR=$DATA_ROOT_DIR/t2t_data # path to root folder where to generate training data

BATCH_SIZE=2048
MAX_LEN=150
WARMUP_STEPS=10000
LEARNING_RATE_CONSTANT=1

# decoding (Tensorboard)
BEAM_SIZE=4
ALPHA=0.6

# artificial data part
TOKEN_ERR_PROB="0.15"
TOKEN_ERR_DISTRIBUTION="0.65_0.1_0.1_0.1_0.05"
CHAR_ERROR_PROB="0.02"
CHAR_ERR_DISTRIBUTION="0.25_0.25_0.25_0.25_0"

LANG="ru"

# technical stuff
NO_EDIT_DATA_DIR=${DATA_DIR}/$PROBLEM-$LANG-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION
DATA_DIR=${NO_EDIT_DATA_DIR}-${EDIT_WEIGHT}
TRAIN_DIR=${TRAIN_DIR}/$PROBLEM-$LANG-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION/$MODEL-$MODEL_TYPE-iwdr${INPUT_WORD_DROPOUT_RATE}-twdr${TARGET_WORD_DROPOUT_RATE}-ew${EDIT_WEIGHT}-ws${WARMUP_STEPS}-lrc${LEARNING_RATE_CONSTANT}
