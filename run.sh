#!/bin/bash
WD="$(dirname "$0")"
cd ${WD}
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${WD}/deps/lin64/copy/"
${WD}/deps/lin64/love src
