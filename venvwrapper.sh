#!/bin/bash

currentDir=$PWD

helpmenu () {
	echo -e "\nVerwendung:  venvwrapper <Operation> [...]\nOperationen:
    venvwrapper {-c --create}   <venv>
	venvwrapper {-i --info} 	<venv>
    venvwrapper {-r --remove}   <venv>
    venvwrapper {-l --list}
    venvwrapper {-h --help}
    venvwrapper {-v --version}\n"
}

open () {
	cd
	if [ -d .venv ]; then
		cd .venv
		if [ -d $1 ]; then
			source $1/bin/activate
		else
			echo "The virtual enviroment $1 doesn't exist!"
		fi
	else
		echo "There are no virtual enviroments created yet!"
	fi
}

create () {
	cd
	if [ -d .venv ]; then
		cd .venv
		python -m venv $1
		echo "The virtual enviroment $1 was created successfully!"
	else
		mkdir .venv
		python -m venv $1
		echo "The virtual enviroment $1 was created successfully!"
	fi
	open $1
}

remove () {
	cd 
	if [ -d .venv ]; then
		cd .venv
		if [ -d ${1} ]; then
			rm -r $1
			echo "The virtual enviroment $1 was deleted successfully!"
		else
			echo "The virtual enviroment $1 does not exist!"
		fi
	else
		echo "There are no virtual enviroments created yet!"
	fi
}

list () {
	cd 
	if [ -d .venv ]; then
		cd .venv
		ls
	fi
}

info () {
	open $1
	pip freeze
	deactivate
}

if [ ! $# -eq 0 ]; then
	case "$1" in
		--help | -h)
			helpmenu
			;;
		--open | -o)
			shift
			if [ $# -eq 1 ]; then
				open $1
			elif [ $# -eq 0 ]; then
				echo "No arguments were passed to --open"
			else
				echo "Too many arguments were passed to --open"
			fi
			;;
		--create | -c)
			shift
			if [ $# -eq 1 ]; then
				create $1
			elif [ $# -eq 0 ]; then
				echo "No arguments were passed to --create"
			else
				echo "Too many arguments were passed to --create"
			fi
			;;
		--remove | -r)
			shift
			if [ $# -eq 1 ]; then
				remove $1
			elif [ $# -eq 0 ]; then
				echo "No arguments were passed to --remove"
			else
				echo "Too many arguments were passed to --remove"
			fi			
			;;
		--list | -l)
			shift
			if [ $# -eq 0 ]; then
				list
			else
				echo "Too many arguments were passed to --list"
			fi			
			;;
		--info | -info)
			shift
			if [ $# -eq 1 ]; then
				info $1
			elif [ $# -eq 0 ]; then
				echo "No arguments were passed to --info"
			else
				echo "Too many arguments were passed to --info"
			fi			
			;;
	esac
else
	helpmenu
fi

cd $currentDir