#!/bin/sh

which bash &> /dev/null
if [ $? -eq 0 ]
then
	echo "[*]Found bash... will install settings"
	bash installer.sh 
else
	echo "[*]Pleas install bash..."
	exit 1
fi
