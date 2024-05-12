export TPU_PREFIX="sfr-enijkamp-tpu-v4-2048-us-central2-b-3"
export RUN_NAME="test_26b"
export OUTPUT_PATH="gs://sfr-xgen-model-research-central2/datasets/maxtext/test_26b"
export DATASET_PATH="gs://sfr-xgen-model-research-central2/datasets/maxtext/c4"

gcloud alpha compute tpus tpu-vm create $TPU_PREFIX --zone us-central2-b --accelerator-type=v4-2048 --version=tpu-ubuntu2204-base --network=sf-research-pv-network --subnetwork=sf-research-us-central2 --tags=proxy-vm --tags=tpu-vm --internal-ips --reserved

python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=salesforce-research-internal --COMMAND="bash setup.sh && bash MaxText/configs/v4/26b.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"
