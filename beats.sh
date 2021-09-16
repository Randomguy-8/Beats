#! /bin/bash

# v1.0
# Made by Harish Kumar
# More INFO: https://www.github.com/Randomguy/Beats


# pre declaring Functions:	
# it cd to mucic file, if exist and ls nearby music
function searchmusic {
		if  [[ -e $path1 ]]
	then
		cd $(dirname $path1)
		ls *.mp3 -c --color -N -X -1
	elif [[ -e $path2 ]]
	then
		cd $(dirname $path2)
		ls *.mp3 -c --color -N -X -1
	elif [[ -e $path3 ]]
	then
		cd $(dirname $path3)
		ls *.mp3 -c --color -N -X -1
	elif [[ -e $path4 ]]
	then
		cd $(dirname $path4)
		ls *.mp3 -c --color -N -X -1
	elif [[ -e $path5 ]]
	then
		cd $(dirname $path5)
		ls *.mp3 -c --color -N -X -1
	elif [[ -e $path6 ]]
	then
		cd $(dirname $path6)
		ls *.mp3 -c --color -N -X -1
	else
		echo "woops! looks like there is no Beat nearby"
	fi
}
# it search for more nearby music...
function moremusic() {
clear
echo
echo "More Beats nearby:"
sleep 0.5
if [[ -e $path1 ]] || [[ -e $path2 ]] || [[ -e $path3 ]] || [[ -e $path4 ]] || [[ -e $path5 ]] || [[ -e $path6 ]]
then	
	searchmusic
else
	cd
	searchmusic
fi
}
# usage!
function xusage() {
	echo "OPPS!"
	echo
	echo "Usage $0 <file_name> | file name includes its extension too."
	echo 
	echo "Remember file_name shouldn't contain whitespace, eg: if the file_name is \"Make you mine.mp3\" then rmove its spaces and reexecute."
	echo "and also you should have to execute file from the same directory, where the tool is present eg: if you are executing it like this \" ./Downloads/beats music.mp3\" then it may not work so you have to cd to same directory and then execute it."
}
# Front page for program
clear
echo
if [[ -e /bin/ffplay ]]
then
	if [[ -z $1 ]]
	then
		xusage
	else
		# asssigning values to other variables so that it can be used inside functions...!
		path1=$1
		path2=$2
		path3=$3
		path4=$4
		path5=$5
		path6=$6
		# cheks if its present in PWD or any other directory
		if [[ -e $1 ]] || [[ -e $2 ]] || [[ -e $3 ]] || [[ -e $4 ]] || [[ -e $5 ]] || [[ -e $6 ]]
		then
			chars="/-\|"
			echo "Playing Beats !||!"
			echo
			echo "Type CTRL+c to stop music"
			ffplay -nodisp -autoexit >/dev/null 2>&1 $1 $2 $3 $4 $5 $6 | while :; do

		  	for (( i=0; i<${#chars}; i++ )); do
		    sleep 0.1
		    echo -en " ${chars:$i:1}" "\rPlaying...  "
			done
			done
			moremusic

		else
			cd
			if [[ -e $1 ]] || [[ -e $2 ]] || [[ -e $3 ]] || [[ -e $4 ]] || [[ -e $5 ]] || [[ -e $6 ]]
			then
			chars="/-\|"
			echo "Playing Beats !||!"
			echo
			echo "Type CTRL+c to stop music"
			ffplay -nodisp -autoexit >/dev/null 2>&1 $1 $2 $3 $4 $5 $6 | while :; do

		  	for (( i=0; i<${#chars}; i++ )); do
		    sleep 0.1
		    echo -en "${chars:$i:1}" "\rPlaying...  "
		  	done
			done
			moremusic
		else
			xusage
			fi
		fi
	fi

else
	echo
	echo "<error>"
	echo
	echo "You need to install ffplay before running this tool,"
	echo "You can install it by <sudo apt install ffmpeg> | or we can even install it right now want to install?"
	echo "Type \"y\" to isntall and \"n\" to cancle."
	read yn
	if [[ $yn = y ]]
	then
		sudo apt install ffmpeg
		$0 $1 $2 $3 $4 $5 $6
	else
		echo "ok as you wish..."
	fi
fi