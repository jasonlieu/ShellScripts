#!/bin/bash

if [ $# = 0 ] ;then				#check for at least 1 argument
	echo Need at least one argument
	exit 1
fi

for i in $@ ;do
	if [ -d "$i" ];then			#check directory
		cd $i
		if [ "$i" = $(pwd) ];then	#check already absolute path
			echo Already absolute path
		else
			echo "$i => $(pwd)"
		fi
	elif [ -f "$i" ];then			#check file or link
		a=$(dirname $i)
		b=$(basename $i)
		echo "$i => $a/$b"
	else 
		echo "path doesn't exist"	#fail both checks
	fi
done
