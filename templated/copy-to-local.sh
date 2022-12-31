#!/bin/sh

mkdir -p /data/repo
gsutil cp gs://BUCKET_NAME/repo/HASH.tar /data/repo/repo.tar
gsutil cp gs://BUCKET_NAME/data.tar /data/repo/data.tar

cd /data/repo
tar xf repo.tar
tar xf data.tar
