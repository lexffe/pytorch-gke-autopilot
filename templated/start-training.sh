#!/bin/sh

mkdir -p /data/repo/weights

cd /data/repo/src/

python3 /data/repo/src/loop.py && python3 /scripts/gscopy.py
