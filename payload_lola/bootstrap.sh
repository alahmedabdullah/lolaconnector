#!/bin/sh
# version 2.0


WORK_DIR=`pwd`

yum -y update
ext="tar.gz"

LOLA_PACKAGE_NAME=$(sed 's/LOLA_PACKAGE_NAME=//' $WORK_DIR/package_metadata.txt)  
mv $WORK_DIR/$LOLA_PACKAGE_NAME /opt
cd /opt
tar xzvf $LOLA_PACKAGE_NAME

cd $WORK_DIR
