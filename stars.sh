#!/bin/bash

isInteger(){
	if [[ $1 =~ ^[+-]?[0-9]+$ ]];then
		return 0
	else
		return 1
	fi
}
if [ $# -eq 1 ] ;then					#check for 1 argument
	:
else
	echo Needs exactly one argument
	exit 1
fi

if isInteger $1 ;then					#check if argument is integer
	:
else	
	echo Needs to be an integer
	exit 2
fi

if [ $1 -gt 0 ] ;then					#check if argument > 0		
	:
else
	echo Needs to be a positive nonzero integer
	exit 3
fi


for (( i=1; i<=$1; i++ ))
do
	for (( j=1; j<=i; j++ ))
	do
		echo -n \*
	done
	echo ""
done
