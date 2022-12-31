#!/usr/bin/env python3

import os
from google.cloud import storage

client = storage.Client()
bucket = client.bucket("BUCKET_NAME")

for filename in os.listdir('/data/repo/weights'):
  blob = bucket.blob(f"/data/repo/weights/{filename}")
  blob.upload_from_filename(filename)

