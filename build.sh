#!/bin/bash
set -e

#Set the working directory
WORKDIR="$(dirname "$0")"
cd ${WORKDIR}

# Set dictories, platforms and other variables
NAME="lovetris"
SOURCEDIR="src"
BUILDDIR="build"
DEPSDIR="deps"
LOVEFILE="${BUILDDIR}/${NAME}.love"
PLATFORMS="win32 win64 lin32 lin64"
LICENSE="LICENSE.md"
THIRDPARTYLICENSE="THIRD-PARTY-LICENSE.md"

#Create new build directory
rm -rf ${BUILDDIR}
mkdir -p ${BUILDDIR}

#Create the love file
cd ${SOURCEDIR} && zip -9 -r ../${LOVEFILE} . && cd ..

#Build executables for all platforms and copy additional required files
for platform in ${PLATFORMS}; do
	mkdir -p ${BUILDDIR}/${platform}
	#Create the executable
	if [ "${platform}" == "win32" ] || [ "${platform}" == "win64" ]; then
		cat ${DEPSDIR}/${platform}/love.exe ${LOVEFILE} > ${BUILDDIR}/${platform}/${NAME}.exe
	else
		cat ${DEPSDIR}/${platform}/love ${LOVEFILE} > ${BUILDDIR}/${platform}/${NAME}
		#Set permissions
		chmod +x ${BUILDDIR}/${platform}/${NAME}
	fi
	
	#copy dependencies
	cp ${DEPSDIR}/${platform}/copy/* ${BUILDDIR}/${platform}/

	#copy license files
	cp ${LICENSE} ${BUILDDIR}/${platform}/license.txt
	cp ${THIRDPARTYLICENSE} ${BUILDDIR}/${platform}/third-party-licenses.txt
	
	#Create a zip with everything you need to run the game
	zip -9 -r ${BUILDDIR}/${NAME}-${platform}.zip ${BUILDDIR}/${platform}/
done
