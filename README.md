### Message Of The Day (MOTD): Funny Quotes

#### Description

This Bash shell script has the following functionalities:

- Retrieving web page content (www.brainyquote.com/quote_of_the_day).
- Parsing HTML file.
- Displaying quote along with author on terminal screen.

#### Setup

The steps that should be taken to set up this script are as follows:

- Clone the GitHub repository (preferably into */home/"user"/projects/*).
	```
	[mkdir ~/projects/]
	git clone git@github.com:mohelhelb/msg_of_the_day.git [~/projects/msg_of_the_day/]
	```
- Install the *cowsay* program on your system.
	```
	sudo apt install cowsay
	```
- **Append** the following snippet of code to the hidden *.bashrc* file (*/home/"user"/.bashrc*):
	```
	## User-defined code

	# --> Message Of The Day (MOTD): Funny Quotes
	# Fetch user
	user=$(whoami)
	# Full path of setup.sh script
	setup="/home/${user}/projects/msg_of_the_day/setup.sh"
	# Check if setup.sh script exists and execute permission is granted
	if [[ -x ${setup} ]]; then
		. ${setup}
	fi
	# <-- Message Of The Day (MOTD): Funny Quotes
	```
- Modify the *basedir* variable (`basedir="/home/${user}"`) in the *motd.sh* script, the *script* variable (`script="/home/${user}/projects/msg_of_the_day/motd.sh"`) in the *setup.sh* script and the above-defined *setup* variable (`setup="/home/${user}/projects/msg_of_the_day/setup.sh"`) accordingly.
- Execute the script.
	```
	[sudo chmod a+x ~/projects/backup_files/backup_files.sh]
	bash ~/projects/backup_files/backup_files.sh
	```
