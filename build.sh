#!/bin/bash
set -e

NAME="lovetris"
BUILDDIR="build"
LOVEFILE="${BUILDDIR}/${NAME}.love"
PLATFORMS="win32 win64 lin32 lin64"

#Create new build directory
rm -rf ${BUILDDIR}
mkdir -p ${BUILDDIR}

#Create the love file
zip -9 -r ${LOVEFILE} . -x .git/\* -x deps/\* -x build/ -x build.sh -x run.sh -x README.md

#Build executables for all platforms and copy additional required files
for platform in ${PLATFORMS}; do
	mkdir -p ${BUILDDIR}/${platform}
	#Create the executable
	if [ "${platform}" == "win32" ] || [ "${platform}" == "win64" ]; then
		cat deps/${platform}/love.exe ${LOVEFILE} > ${BUILDDIR}/${platform}/${NAME}.exe
	else
		cat deps/${platform}/love ${LOVEFILE} > ${BUILDDIR}/${platform}/${NAME}
		#Set permissions
		chmod +x ${BUILDDIR}/${platform}/${NAME}
	fi
	
	#copy dependencies
	cp deps/${platform}/copy/* ${BUILDDIR}/${platform}/
done


