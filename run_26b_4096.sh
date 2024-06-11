export TPU_PREFIX="sfr-ext_erik_nijkamp_salesforce_com-tpu-v4-4096-us-central2-b-1"
export RUN_NAME="test_26b_4096"
export OUTPUT_PATH="gs://sfr-xgen-model-research-test/datasets/maxtext/test_26b_4096"
export DATASET_PATH="gs://sfr-xgen-model-research-test/datasets/maxtext/c4"

gcloud alpha compute tpus tpu-vm create $TPU_PREFIX --zone=us-central2-b --accelerator-type=v4-4096 --version=tpu-ubuntu2204-base --project=ehc-smeadusani-a73e97 --reserved --tags=tpu-vm --internal-ips
# gcloud compute tpus tpu-vm ssh ext_erik_nijkamp_salesforce_com@sfr-ext_erik_nijkamp_salesforce_com-tpu-v4-4096-us-central2-b-1 --zone us-central2-b --worker=129 --internal-ip

python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash setup.sh"
python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash setup.sh && bash MaxText/configs/v4/26b_4096.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"
