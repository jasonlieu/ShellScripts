#!/bin/bash

isInteger(){
	if [[ $1 =~ ^[+-]?[0-9]+$ ]];then
		return 0
	else
		return 1
	fi
}

if [ $# -eq 3 ] ;then						#check for 3 arguments
	:
else
	echo Needs exactly 3 arguments
	exit 1
fi

if isInteger $1 && isInteger $3 ;then				#check if arguments 1 and 3 are integers
	:
else
	echo Both operand 1 and operand 2 need to be integers
	exit 2
fi

if [ $2 = "+" ] || [ $2 = "-" ] || [ $2 = "x" ] || [ $2 = "/" ];then	#check if argument 2 is operand
	:
else
	echo There needs to be a valid operator in the middle
	exit 2
fi

case "$1 $2 $3" in
	"$1 + $3") echo $(( $1 + $3 ));;
	"$1 - $3") echo $(( $1 - $3 ));;
	"$1 x $3") echo $(( $1 * $3 ));;
	"$1 / $3")
	if [ $3 = 0 ];then					#check if $3 is 0, can't divide by 0
		echo error:cannot divide by 0
		exit 3
	else
		echo $(( $1 / $3 ))
	fi;;
esac			
