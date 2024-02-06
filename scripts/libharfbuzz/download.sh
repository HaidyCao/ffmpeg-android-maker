#!/usr/bin/env bash

source ${SCRIPTS_DIR}/common-functions.sh

HARFBUZZ_VERSION=8.3.0

downloadTarArchive \
  "libharfbuzz" \
  "https://github.com/harfbuzz/harfbuzz/releases/download/${HARFBUZZ_VERSION}/harfbuzz-${HARFBUZZ_VERSION}.tar.xz"
