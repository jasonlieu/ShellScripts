#!/bin/bash

if [ $1 ];then					#check for arguments, if any then exit
	echo No arguments
	exit 1
else
	:
fi

name=$(whoami)					#get name
time=$(date +%I:%M" "%p)			#get time
check=$(date +%H)				#check for time of day

echo -n Hello $name, it is $time.		#print name and time

if [ $check -ge 6 ] && [ $check -lt 12 ] ;then	#check morning
	echo " Have a good morning!"
fi

if [ $check -ge 12 ] && [ $check -lt 18 ] ;then	#check noon
	echo " Have a good afternoon!"
fi

if [ $check -ge 18 ] && [ $check -lt 24 ] ;then	#check evening
	echo " Have a good evening!"
fi

if [ $check -eq 24 ] && [ $check -ge 1 ] && [ $check - lt 6 ] ;then	#check early morning
	echo " Don't work too hard!"
fi
