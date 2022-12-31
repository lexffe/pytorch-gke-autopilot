#!/bin/sh

gsutil cp gs://BUCKET_NAME/repo/35c595d.tar /data/repo.tar

cd /data/repo
tar xf repo.tar
