#!/bin/bash

if [ $# -eq 0 ] ;then					#check for arguments
	echo Need arguments
	exit 1
fi

flag=""							#flag to check if option was given	
while getopts "lu" opt
do
	case $opt in
		l)	
		flag="asd"				#flag triggered, option given
		if [ "$2" = "-u" ] ;then		#check for 1 option
			echo Only one option
			exit 2
		fi
		for i in "$@" 
		do
			if [ "$i" != "$1" ] ;then	#skip -l
				echo $i | tr [A-Z] [a-z]	#lower
			fi
		done;;
		u)
		flag="asd"				#flag triggered, option given
		if [ "$2" = "-l" ] ;then		#check for 1 option
			echo Only one option
			exit 3
		fi	
		for i in "$@"
		do
			if [ "$i" != "$1" ] ;then	#skip -u
				echo $i | tr [a-z] [A-Z]	#upper
			fi
		done;;
		*)
		exit 4;;
	esac
done

if [ -z "$flag" ] ;then					#if flag triggered, No option given
	echo No option given
	exit 5
fi
