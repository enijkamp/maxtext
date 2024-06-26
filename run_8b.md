## Run

```bash
SLICE=sfr-enijkamp-tpu-v4-256-us-central2-b-1

# create a TPU slice
gcloud alpha compute tpus tpu-vm create $SLICE --zone us-central2-b --accelerator-type=v4-256 --version=tpu-ubuntu2204-base --network=sf-research-pv-network --subnetwork=sf-research-us-central2 --tags=proxy-vm --tags=tpu-vm --internal-ips --reserved

# EDIT the environmental variables in the run.sh
# Testing the 8B GQA from exp_1850. Config is in MaxText/configs/v4/8b.sh
bash run_8b.sh
```

## Changes

* setup.sh
  * Added `~/.local/bin` to PATH because `pre-commit` is not recognized.
* train.py
  * Added `jax.distributed.initialize()` at the beginning of train.py, which was necessary.

## Notes
* [Base config](MaxText/configs/base.yml) has a variety of untouched flags, including different degree of remat.
