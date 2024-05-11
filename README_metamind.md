
```bash
# create a TPU slice

SLICE=hiroakihayashi@sfr-hiroakihayashi-tpu-v4-256-us-central2-b-1

gcloud compute tpus tpu-vm scp upgrade_python.sh $SLICE --zone us-central2-b --internal-ip --worker=all
gcloud compute tpus tpu-vm ssh $SLICE --zone us-central2-b --internal-ip --worker=all --command="bash upgrade_python.sh"

# edit the environmental variables in the run.sh
# Testing the 8B GQA from exp_1850. Config is in MaxText/configs/v4/8b.sh
bash run.sh
```

## Notes

* By default the TPU VM uses the old python3.8, which can't find the latest jax package. Update script is there.
* Added `jax.distributed.initialize()` at the beginning of train.py, which was necessary.
* [Base config](MaxText/configs/base.yml) has a variety of untouched flags, including different degree of remat.
* There is a config dir for v5p. When running on there, maybe there is a separate optimization?
