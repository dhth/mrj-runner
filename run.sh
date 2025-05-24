#!/usr/bin/env bash

set -euxo pipefail

last_build_num=$(cat run-number.txt)
build_num=$((last_build_num + 1))

python3 replace.py \
    --template templates/run.html \
    --output "runs/run-${build_num}.html" \
    --build-num "$build_num" \
    --content-file output.txt

mkdir dist
python3 generate_index.py \
    --template templates/index.html \
    --output dist/index.html \
    --runs-dir runs

ls -1t runs/run-*.html | tail -n +21 | xargs -r rm --
cp runs/run-*.html dist

echo $build_num >run-number.txt
