#!/bin/bash

# Message Of The Day (MOTD): Funny Quotes
#########################################

# --> Script functions
# Print quote
function print_quote {
	local quote=$1
	printf "%*s\n" ${margin} "${quote}"
}
# <-- Script functions
# Quotation site
wpage="www.brainyquote.com/quote_of_the_day"
# Fallback quotes
alt_quote1="Lorem ipsum dolor sit amet..."
alt_quote2="Sometimes when my internet is down, I forget that the rest of my computer still works..."
alt_quote3="Ut enim ad minim veniam..."
#
timestamp=$(date +%s)
# 
basedir="/tmp"
log_file="${basedir}/log.${timestamp}"
html_file="${basedir}/html.${timestamp}"
quote_file="${basedir}/quote.${timestamp}"
# Pattern
pattern="Funny Quote Of the Day"
# Check first positional parameter validity
margin=$1
if [[ ${margin} =~ ^[0-9]+$ ]]; then
	margin=$[ ${margin} - 1 ]
else
	margin=0
fi
# Clear out terminal screen
clear
# Check page availability
wget -q --spider ${wpage}
case $? in
	0)
		# Gather page content
		wget -o ${log_file} -O ${html_file} ${wpage}
		# Extract quote/author (Pattern: Funny Quote Of the Day) and write it to quote file
		sed 's/<[^>]*>//g ; /^$/d' ${html_file} | sed -n "/^${pattern}$/{n ; N ; s/&#39;/'/g ; p}" > ${quote_file}
		# Check if quote file exists and is not empty
		if [[ -s ${quote_file} ]]; then
			echo
			while read line
			do
				# Print quote/author
				print_quote "${line}"
			done < ${quote_file}
		else
			# Print fallback quote 1
			print_quote "${alt_quote1}"
		fi
		;;
	4)
		# Print fallback quote 2 (Exit status 4: Network Failure)
		print_quote "${alt_quote2}"
		;;
	*)
		# Print fallback quote 3
		print_quote "${alt_quote3}"
		;;
esac
