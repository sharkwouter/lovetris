#!/bin/bash
set -e

NAME="lovetris"
BUILDDIR="build"
LOVEFILE="${BUILDDIR}/${NAME}.love"

#Create new build directory
rm -rf ${BUILDDIR}
mkdir -p ${BUILDDIR}

#Create the love file
zip -9 -r ${LOVEFILE} . -x .git/\* -x deps/\* -x build/ -x build.sh -x run.sh -x README.md

#Build the different platforms
cat deps/love64.exe ${LOVEFILE} > ${BUILDDIR}/${NAME}.exe
cat deps/love32.exe ${LOVEFILE} > ${BUILDDIR}/${NAME}-win32.exe
cat deps/love ${LOVEFILE} > ${BUILDDIR}/${NAME}

#Set permissions
chmod +x ${BUILDDIR}/*-lin*
