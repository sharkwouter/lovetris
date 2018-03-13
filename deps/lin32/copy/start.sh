WD="$(dirname "$0")"
cd ${WD}
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${WD}"
./lovetris
