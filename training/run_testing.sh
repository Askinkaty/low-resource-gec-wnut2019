set -x

configuration_file=$1

source ${configuration_file}
echo "Configuration file loaded"

echo "Copying vocab"
mkdir -p $NO_EDIT_DATA_DIR
cp $VOCAB_PATH $NO_EDIT_DATA_DIR/vocab.$PROBLEM.32768.subwords

echo "Generating data into ${NO_EDIT_DATA_DIR} for problem: ${PROBLEM}"
# generate data

t2t-datagen \
   --t2t_usr_dir="${PROBLEM_DIR}" \
   --data_dir="${NO_EDIT_DATA_DIR}" \
   --tmp_dir=/tmp/${PROBLEM} \
   --problem=$PROBLEM \






t2t-decoder --data_dir ${NO_EDIT_DATA_DIR} \
--problem artificial_errors --model transformer \
--hparams_set transformer_base_single_gpu \
--decode_hparams="beam_size=4,alpha=0.6" \
--output_dir ${MODEL_PATH} \
--decode_from_file=${INPUT_FILE} \
--decode_to_file=${OUTPUT_FILE} \
--t2t_usr_dir=${PROBLEM_DIR}
