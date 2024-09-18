#!/bin/bash
set -o errexit -o nounset -o pipefail
command -v shellcheck >/dev/null && shellcheck "$0"

git submodule update --init

SOURCE_FOLDER="external/babylon"

cd "$SOURCE_FOLDER"
make build
make install
cd -
