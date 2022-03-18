#!/bin/sh

#-- Terminal colors
NC="\033[0m"       #-- Reset color
BLUE="\033[1;34m"
RED="\033[1;31m"
GREEN="\033[1;32m"

#-- The NWjs binary for ARM is a tarball (tar.gz) that should be 
#-- uncompressed and copied to the icestudio/aarch64 (DESTINATION) folder

echo "* ARGUMENTS: $1"

#-- The NW tarball name (not extension) is received as an argument
NW_NAME=$1 
NW_NAME_TAR_GZ="$NW_NAME.tar.gz"

#-- Folder where to uncompress the NW dist tarball
DIST_TMP="dist/tmp/nwjsAarch64"

#-- Folder where the final NW binary files should be copied
DESTINATION="dist/icestudio/aarch64"

#-- The NW tarball is locate in the following path, once the
#-- DIST tarball is unzipped
NW_PATH="$DIST_TMP/usr/docker/dist/nwjs-chromium-ffmpeg-branding"  

#-- Src folder where the NW files have been unzipped
NW_SRC_PATH="$DIST_TMP/$NW_NAME"

#-- NW tarball with path
NW_TARBALL="$NW_PATH/$NW_NAME_TAR_GZ"


#-- Unzip the NW tarball into the cache folder
#echo "${BLUE}unzipping the NW tarball: $NW_NAME_TAR_GZ${NC}"
#tar xzf "$NW_TARBALL" -C $DIST_TMP

#-- Copy the NW files to the DESTINATION folder

echo "${GREEN}Copying NW files...${NC}"
echo "From: $NW_SRC_PATH/*"
echo "To: $DESTINATION/"
cp -R $NW_SRC_PATH/* $DESTINATION/

#-- The icestudio executable file is called nw
#-- rename it to icestudio
mv $DESTINATION/nw $DESTINATION/icestudio

#-- Give execution permission to icestudio file
chmod +x $DESTINATION/icestudio

echo "${GREEN}NW for Arm64 ready${NC}"

