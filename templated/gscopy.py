#!/usr/bin/env python3

import os
from google.cloud import storage

client = storage.Client()
bucket = client.bucket("BUCKET_NAME")

directory = '/Users/asm/repos/pytorch-gke-autopilot/templated'

for filename in os.listdir(directory):
  blob = bucket.blob(f"weights/{filename}")
  blob.upload_from_filename(f"{directory}/{filename}")

