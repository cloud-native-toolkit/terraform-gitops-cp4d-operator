#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname "$0"); pwd -P)
MODULE_DIR=$(cd "${SCRIPT_DIR}/.."; pwd -P)
CHART_DIR=$(cd "${MODULE_DIR}/charts/ibm-cp4d"; pwd -P)

NAME="$1"
DEST_DIR="$2"

mkdir -p $DEST_DIR

## Add logic here to put the yaml resource content in DEST_DIR

cp -R "${CHART_DIR}"/* "${DEST_DIR}"

echo $VALUES_CONTENT > "${CHART_DIR}/values.yaml"

find "${DEST_DIR}" -name "*"

