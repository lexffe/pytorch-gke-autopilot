# pytorch-gke-autopilot

## Contains

- YAMLs for a service account, a job
- Scripts to copy 

## How it works

- Data is copied to local storage using the gcloud CLI (as an init container)
- Trained model is saved to scratch disk
- Main container shares a volume with a sidecar.
	- The sidecar checks if main container has exited (using a simple file check) every x second.
	- Sidecar copies the trained model data back to bucket.

## Assumption

- kubectl is installed
- no backups required: you should download the trained model to somewhere else
  once it's trained.
- You don't need conda.
  - You _could_ but the deep learning containers already has the libraries you need.

## Commands

```shell
gtar -c -f $(git rev-parse --short HEAD).tar --owner=0 --group=0 --no-same-owner --no-same-permissions src/ data/
gsutil cp $(git rev-parse --short HEAD).tar gs://bucket/repo/$(git rev-parse --short HEAD).tar
gcloud container clusters get-credentials CLUSTER_NAME \
    --region REGION \
    --project PROJECT_ID

./run_template.sh
k apply -k generated
```
