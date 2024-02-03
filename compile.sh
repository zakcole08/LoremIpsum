#!/bin/bash

echo -e '\e[33m!--- You will need to have the cc or gcc compiler installed! ---!\e[0m'

if [ `dpkg -s libedit-dev` ]
	then
	cc -std=c99 -Wall loremipsum.c mpc/mpc.c -ledit -lm -o loremipsum
fi

	if [ `source /etc/os-release -eq "fedora"` ]
		then
		echo -e '\e[33mInstalling libedit-dev...\e[0m'
		su -c "yum install libedit-dev*"
		cc -std=c99 -Wall loremipsum.c mpc/mpc.c -ledit -lm -o loremipsum

	else
		echo -e '\e[33mInstalling libedit-dev...\e[0m'
		sudo apt install libedit-dev
		cc -std=c99 -Wall loremipsum.c mpc/mpc.c -ledit -lm -o loremipsum
	fi

if [ $? -eq 1 ]
	then
	echo -e '\e[31mPlease ensure the cc or gcc compiler is installed before running this script\e[0m'
fi
