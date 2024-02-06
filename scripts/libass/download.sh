#!/usr/bin/env bash

source ${SCRIPTS_DIR}/common-functions.sh

ASS_VERSION=0.17.1

downloadTarArchive \
  "libass" \
  "https://github.com/libass/libass/releases/download/${ASS_VERSION}/libass-${ASS_VERSION}.tar.gz"

