#!/bin/bash

echo -e '\e[33m!--- You will need to have the cc or gcc compiler installed before running this script! ---!\e[0m'

source /etc/os-release

if [ "$ID" == "fedora" ]
                then
                if dnf list installed | grep libedit-dev
                then
                cc -std=c99 -Wall loremipsum.c mpc/mpc.c -ledit -lm -o loremipsum

                else
                echo -e '\e[33mInstalling libedit-dev...\e[0m'
                su -c "yum install libedit-dev*"
                cc -std=c99 -Wall loremipsum.c mpc/mpc.c -ledit -lm -o loremipsum
                fi

else
        if ! dpkg -s libedit-dev
        then
        echo -e '\e[33mInstalling libedit-dev...\e[0m'
        sudo apt install libedit-dev
        fi

        cc -std=c99 -Wall loremipsum.c mpc/mpc.c -ledit -lm -o loremipsum
fi

if [ $? -eq 0 ]
        then
        echo -e '\e[32mCompilation successful!\e[0m'
else
        echo -e '\e[31mPlease ensure the cc or gcc compiler is installed before running this script\ndebian: sudo apt install build-essential\nfedora: su -c "yum groupinstall development-tools"\e[0m'
fi
