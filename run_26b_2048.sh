export TPU_PREFIX="sfr-enijkamp-tpu-v4-2048-us-central2-b-1"
export RUN_NAME="test_26b_2048"
export OUTPUT_PATH="gs://sfr-xgen-model-research-test/datasets/maxtext/test_26b_2048"
export DATASET_PATH="gs://sfr-xgen-model-research-test/datasets/maxtext/c4"

gcloud alpha compute tpus tpu-vm create $TPU_PREFIX --zone us-central2-b --accelerator-type=v4-2048 --version=tpu-ubuntu2204-base --reserved

python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash setup.sh && bash MaxText/configs/v4/26b_2048.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"
