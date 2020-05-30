#!/bin/bash
#Dependencies: imgcat, normal linux build tools for c code, qrencode
#Create a QuickConnect Link for a Node
#Usage: ./qc.sh USERNAME HIDDEN_SERVICE_DIR (not the full path)

#Check if imgcat is installed
IMGCAT=/usr/local/bin/imgcat
if test -f "$IMGCAT"; then
	echo "imgcat installed already"
else
	echo "imgcat not installed; installing now"
	git clone https://github.com/eddieantonio/imgcat.git
	cd imgcat
	autoconf
	./configure
	make && sudo make install
fi
#
USER_LOCATION=$1
HIDDEN_SERVICE=$2
rpcuser=$(cat /home/$USER_LOCATION/.bitcoin/bitcoin.conf | grep "rpcuser")
l=${#rpcuser}
rpcuser=${rpcuser:8:$l}
rpcpass=$(cat /home/$USER_LOCATION/.bitcoin/bitcoin.conf | grep "rpcpass")
x=${#rpcpass}
rpcpass=${rpcpass:12:$x}
onion=$(cat /var/lib/tor/$HIDDEN_SERVICE/hostname)
URL="btcstandup://$rpcuser:$rpcpass@$onion:8332/?" 
echo "$URL" | qrencode -m 10 -o qrcode.png
imgcat --width=50 --height=25 qrcode.png 

