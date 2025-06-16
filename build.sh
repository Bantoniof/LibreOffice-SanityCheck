#!/bin/bash
 
# This file update the information of versions in description.xml
# and  the update information.xml
# and build (compress) the extension

Ext="SanityCheck"
RotExt="SanityCheck"

if [[ ! $1 ]]
then
	echo "Usage:"
	echo "./build.sh [version]"
	echo "example: ./build.sh 12.2.3"
	exit
	else
	echo
    echo "### updating " $RotExt"/description.xml"
   cd $RotExt
	sed -i s'/<version value.*/<version value="'$1'"\/>/' description.xml
    echo "### Compiling " $Ext
    # I use 7zip but you can use zip:
    # zip -r SanityCheck.oxt .
     7z a ./$Ext.oxt . -tzip
     cd ..
    mv $RotExt/$Ext.oxt ./
    echo 
    echo "### updating " $Ext".update.xml"
	sed -i s'/<version value.*/<version value="'$1'"\/>/' $Ext.update.xml
	#La  siguiente linea es para las releases. si se usa directamente de main dará problemas
	sed -i s'/raw.*/raw\/v'$1'\/'$Ext'.oxt"\/>/' $Ext.update.xml
    echo "### Done"
fi
