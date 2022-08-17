TRANSLATE='gpu'
NUM_GPUS=3

INPUT_WORD_DROPOUT_RATE=0.2
TARGET_WORD_DROPOUT_RATE=0.1
EDIT_WEIGHT=3

MODEL=transformer
MODEL_TYPE=transformer_base_single_gpu

CHECKPOINT_PATH=/scratch/project_2002016/t2t_train/artificial_errors-ru-tep0.15-ted0.65_0.1_0.1_0.1_0.05-cep0.02-ced0.25_0.25_0.25_0.25_0/transformer-transformer_base_single_gpu-iwdr0.2-twdr0.1-ew3-ws10000-lrc1

EXPERIMENT_ROOT_DIR=/projappl/project_2002016/low-resource-gec-wnut2019/training
DATA_ROOT_DIR=/scratch/project_2002016

PROBLEM=finetune_general_problem
PROBLEM_DIR=$EXPERIMENT_ROOT_DIR/problems/
TRAIN_DIR=$DATA_ROOT_DIR/t2t_train # path to root folder where to store model checkpoints
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

DATA_RATIO=1
ADDITIONAL_ARTIFICIAL_SENTENCES=2000000
ADDITIONAL_WIKI_SENTENCES=0
ADDITIONAL_DATA_FILTERED=False

LANG="ru"
INPUT_SENTENCE_FILE="/scratch/project_2002016/datasets/data-gec/clang8rulecrl/train.src"
TARGET_SENTENCE_FILE="/scratch/project_2002016/datasets/data-gec/clang8rulecrl/train.src"
EVAL_DATA_DIR="/scratch/project_2002016/datasets/data-gec/clang8rulecrl"

# technical stuff
VOCAB_PATH=${DATA_DIR}/artificial_errors-$LANG-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION/vocab.artificial_errors.32768.subwords


NO_EDIT_DATA_DIR=${DATA_DIR}/$PROBLEM-$LANG-finetune-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION-aap${ADDITIONAL_ARTIFICIAL_SENTENCES}-awp${ADDITIONAL_WIKI_SENTENCES}-adf${ADDITIONAL_DATA_FILTERED}-ratio${DATA_RATIO}
DATA_DIR=${NO_EDIT_DATA_DIR}-${EDIT_WEIGHT}
PRETRAINED_DIR=${TRAIN_DIR}/artificial_errors-$LANG-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION/$MODEL-$MODEL_TYPE-iwdr${INPUT_WORD_DROPOUT_RATE}-twdr${TARGET_WORD_DROPOUT_RATE}-ew${EDIT_WEIGHT}-ws${WARMUP_STEPS}-lrc${LEARNING_RATE_CONSTANT}
TRAIN_DIR=${TRAIN_DIR}/$PROBLEM-$LANG-finetune-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION/$MODEL-$MODEL_TYPE-iwdr${INPUT_WORD_DROPOUT_RATE}-twdr${TARGET_WORD_DROPOUT_RATE}-ew${EDIT_WEIGHT}-ws${WARMUP_STEPS}-lrc${LEARNING_RATE_CONSTANT}-aap${ADDITIONAL_ARTIFICIAL_SENTENCES}-awp${ADDITIONAL_WIKI_SENTENCES}-adf${ADDITIONAL_DATA_FILTERED}-ratio${DATA_RATIO}
