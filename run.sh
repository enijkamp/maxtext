
export TPU_PREFIX="sfr-hiroakihayashi-tpu-v4-256-us-central2-b-1"
export RUN_NAME="test"
export OUTPUT_PATH="gs://sfr-xgen-model-research-central2/datasets/maxtext/test_exp"
export DATASET_PATH="gs://sfr-xgen-model-research-central2/datasets/maxtext/c4"



python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=salesforce-research-internal --COMMAND="bash setup.sh && bash MaxText/configs/v4/8b.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"
