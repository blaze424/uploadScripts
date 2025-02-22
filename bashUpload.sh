#!/bin/bash

rm -rf uploads
mkdir uploads

mv out/target/product/*/*.zip uploads
mv out/target/product/sweet/recovery.img uploads

tar -czvf /tmp/uploads.tgz uploads && curl https://bashupload.com/uploads.tgz --data-binary @/tmp/uploads.tgz
