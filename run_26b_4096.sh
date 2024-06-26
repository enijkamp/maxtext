export TPU_PREFIX="sfr-ext_erik_nijkamp_salesforce_com-tpu-v4-4096-us-central2-b-1"
export DATASET_PATH="gs://sfr-xgen-model-research-test/datasets/maxtext/c4"

gcloud alpha compute tpus tpu-vm create $TPU_PREFIX --zone=us-central2-b --accelerator-type=v4-4096 --version=tpu-ubuntu2204-base --project=ehc-smeadusani-a73e97 --reserved --tags=tpu-vm --internal-ips
# gcloud compute tpus tpu-vm ssh ext_erik_nijkamp_salesforce_com@sfr-ext_erik_nijkamp_salesforce_com-tpu-v4-4096-us-central2-b-1 --zone us-central2-b --worker=129 --internal-ip

python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash setup.sh"

export RUN_NAME="test_26b_4096_v1_prof"
export OUTPUT_PATH="gs://sfr-xgen-model-research-test/maxtext/test_26b_4096_v1_prof"
python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash MaxText/configs/v4/26b_4096_v1.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"


export RUN_NAME="test_26b_4096_v2"
export OUTPUT_PATH="gs://sfr-xgen-model-research-test/maxtext/test_26b_4096_v2"
python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash MaxText/configs/v4/26b_4096_v2.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"


export RUN_NAME="test_26b_4096_v3"
export OUTPUT_PATH="gs://sfr-xgen-model-research-test/maxtext/test_26b_4096_v3"
python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash MaxText/configs/v4/26b_4096_v3.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"


export RUN_NAME="test_26b_4096_v4"
export OUTPUT_PATH="gs://sfr-xgen-model-research-test/maxtext/test_26b_4096_v4"
python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash MaxText/configs/v4/26b_4096_v4.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"


export RUN_NAME="test_26b_4096_v5"
export OUTPUT_PATH="gs://sfr-xgen-model-research-test/maxtext/test_26b_4096_v5"
python3 multihost_runner.py --TPU_PREFIX=${TPU_PREFIX} --ZONE=us-central2-b --PROJECT=ehc-smeadusani-a73e97 --COMMAND="bash MaxText/configs/v4/26b_4096_v5.sh RUN_NAME=${RUN_NAME} OUTPUT_PATH=${OUTPUT_PATH} DATASET_PATH=${DATASET_PATH}"

