#!/bin/bash
set -o errexit -o nounset -o pipefail
command -v shellcheck >/dev/null && shellcheck "$0"

BIN="babylond"
SOURCE_REPO="babylon-private"
SOURCE_FOLDER="$(dirname "$0")/../../$SOURCE_REPO"
OUTPUT_FOLDER="$(dirname "$0")/../$SOURCE_REPO"

echo "DEV-only: copy from locally built"
cp -f  "$SOURCE_FOLDER"/build/${BIN} "$OUTPUT_FOLDER/$BIN-$(uname -m)"
gzip -9 "$OUTPUT_FOLDER/$BIN-$(uname -m)"

cd "$SOURCE_FOLDER"
TAG=$(git rev-parse HEAD)
cd - 2>/dev/null
echo "$TAG" >"$OUTPUT_FOLDER/version.txt"
