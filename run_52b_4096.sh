export TPU_PREFIX="sfr-enijkamp-tpu-v4-4096-us-central2-b-1"
export RUN_NAME="run_52b_4096"
export OUTPUT_PATH="gs://sfr-xgen-model-research-test/datasets/maxtext/run_52b_4096"
export DATASET_PATH="gs://sfr-xgen-model-research-test/datasets/maxtext/c4"

gcloud alpha compute tpus tpu-vm create $TPU_PREFIX --zone us-central2-b --accelerator-type=v4-2048 --version=tpu-ubuntu2204-base --reserved

python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash setup.sh && bash MaxText/configs/v4/52b.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"
