#!/bin/sh

for APT in `find /etc/apt/ -name \*.list`; do
    grep -o "^deb http://ppa.launchpad.net/[a-z0-9\-]\+/[a-z0-9\-]\+" $APT | while read ENTRY ; do
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        echo  ppa:$USER/$PPA
    done
done


# resposta do usuario stwissel no askubuntu
# obrigado pelo script
# http://askubuntu.com/a/148968
