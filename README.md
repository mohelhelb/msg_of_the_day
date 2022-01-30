### Message Of The Day (MOTD): Funny Quotes

This Bash shell script has the following functionalities:

- Retrieving web page content (www.brainyquote.com/quote_of_the_day).
- Parsing HTML file.
- Displaying quote along with author on terminal screen.

The steps that should be taken to set up this script are as follows:

- Clone the GitHub repository (preferably into */home/"user"/projects/*).
- **Append** the following snippet of code to the hidden *.bashrc* file (*/home/"user"/.bashrc*):
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
- Modify the *script* variable in the *setup.sh* script and the above-defined *setup* variable accordingly.
