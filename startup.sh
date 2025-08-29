#!/usr/bin/env bash

liquidctl --match kraken set logo color fixed FF2400
liquidctl --match kraken set ring color fixed 000000

"$HOME/Downloads/msi-rgb/target/release/msi-rgb" 000000 000000 000000 -ir -ig -ib -d 5

if ! xmodmap ~/.Xmodmap; then
	echo "failed to setup xmodmap"
fi

# need to configure the !whoami to allow this command
# bellow to be called without sudo/passwd
swapoff -a
free -h

# restart the bluetooth just want to clean it
systemctl restart bluetooth.service
systemctl restart bluetooth.target
