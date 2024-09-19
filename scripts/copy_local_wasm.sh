#!/bin/bash
set -o errexit -o nounset -o pipefail
command -v shellcheck >/dev/null && shellcheck "$0"

CONTRACT="storage_contract"
SOURCE_REPO=${CONTRACT/_/-}
SOURCE_FOLDER="$(dirname "$0")/../$SOURCE_REPO"
OUTPUT_FOLDER="$(dirname "$0")/../bytecode/"

echo "DEV-only: copy from local built instead of downloading"

cp -f  "$SOURCE_FOLDER"/artifacts/${CONTRACT}*.wasm "$OUTPUT_FOLDER/$CONTRACT.wasm"

cd "$SOURCE_FOLDER"
TAG=$(git rev-parse HEAD)
cd - 2>/dev/null
echo "$TAG" >"$OUTPUT_FOLDER/version.txt"
