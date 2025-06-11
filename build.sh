#!/bin/bash
 
# This file update the information of versions
# and compress the extension

Ext="SanityCheck"
RotExt="SanityCheck"

if [[ ! $1 ]]
then
	echo "Usage:"
	echo "./versionar.sh version"
	echo "example: ./versionar.sh 12.2.3"
	exit
	else
	echo
    echo "### updating " $RotExt"/description.xml"
   cd $RotExt
	sed -i s'/<version value.*/<version value="'$1'"\/>/' description.xml
    echo "### Compiling " $Ext
    # zip -r SanityCheck.oxt .
     7z a ./$Ext.oxt . -tzip
     cd ..
    mv $RotExt/$Ext.oxt ./
    echo 
    echo "### updating " $Ext".update.xml"
	sed -i s'/<version value.*/<version value="'$1'"\/>/' $Ext.update.xml
    echo "### Done"
fi
