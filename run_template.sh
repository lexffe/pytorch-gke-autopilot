#!/bin/sh

source ./.env
rm -r ./generated
mkdir -p ./generated
cp ./templated/* ./generated

cd generated/
find . -type f -print0 | xargs -0 sed -i "" s/BUCKET_NAME/"${BUCKET_NAME}"/g
find . -type f -print0 | xargs -0 sed -i "" s/GSA_EMAIL/"${GSA_EMAIL}"/g
