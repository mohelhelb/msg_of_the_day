#!/bin/bash

# Message Of The Day (MOTD): Funny Quotes
#########################################

# --> Script functions
# Print alternative quote along with author
function print_quote {
	local quote=$1
	local author=$2
	printf "%s\n%s\n" "${quote}" "${author}"
}
# <-- Script functions
# Fetch user
user=$(whoami)
# Quotation site
wpage="www.brainyquote.com/quote_of_the_day"
# Fallback quotes
alt_quote1="I have not failed. I've just found 10,000 ways that won't work."
author1="Thomas A. Edison"
alt_quote2="Sometimes when my internet is down, I forget that the rest of my computer still works..."
author2=${user}
#
basedir="/home/${user}"
html_file="${basedir}/.html_file.txt"
# Search pattern
pattern="Funny Quote Of the Day"
# Gather page content
wget -q -O ${html_file} ${wpage}
case $? in
	0)
		# Extract quote/author (Pattern: Funny Quote Of the Day) and write them to STDOUT
		sed 's/<[^>]*>//g ; /^$/d' ${html_file} | sed -n "/^${pattern}$/{n ; N ; s/&#39;/'/g ; p}"
		;;
	4)
		# Print fallback quote 2 (Exit status 4: Network Failure)
		print_quote "${alt_quote2}" "${author2}"
		;;
	*)
		# Print fallback quote 1
		print_quote "${alt_quote1}" "${author1}"
		;;
esac
