#!/bin/bash

## User-defined code

# --> Message Of The Day (MOTD): Funny Quotes
# Fetch user
user=$(whoami)
#
script="/home/${user}/projects/msg_of_the_day/motd.sh"
# 
term=$(basename $(tty))
# Clear out screen
clear
# Display quote only on terminal emulator 0 or virtual console 1-6
case ${term} in
	0|tty[1-6])
		# Check if script exists and execute permission is granted
		if [[ -x ${script} ]]; then
			# Cowsay quote along with author
			. ${script} | cowsay -wn
		fi
		;;
esac
# <-- Message Of The Day (MOTD): Funny Quotes
