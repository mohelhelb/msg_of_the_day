#!/bin/bash

# Message Of The Day (MOTD): Funny Quotes
#########################################

# --> Script functions
# Print quote/author
function print_quote {
	local quote=$1
	local author=$2
	printf "\n%*s\n%*s\n" ${margin} "${quote}" ${margin} "${author}"
}
# <-- Script functions
# Quotation site
wpage="www.brainyquote.com/quote_of_the_day"
# Fallback quotes
alt_quote1="I have not failed. I've just found 10,000 ways that won't work."
author1="Thomas A. Edison"
alt_quote2="Sometimes when my internet is down, I forget that the rest of my computer still works..."
author2=$(whoami)
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
		# Extract quote/author (Pattern: Funny Quote Of the Day) and write them to quote file
		sed 's/<[^>]*>//g ; /^$/d' ${html_file} | sed -n "/^${pattern}$/{n ; N ; s/&#39;/'/g ; p}" > ${quote_file}
		# Create quote/author variables
		quote=$(sed -n '1p' ${quote_file})
		author=$(sed -n '2p' ${quote_file})
		# Check if quote/author variables are not empty strings
		if [[ -n ${quote} ]] && [[ -n ${author} ]]; then
			# Print quote/author on terminal screen
			print_quote "${quote}" "${author}"
		else
			# Print fallback quote 1
			print_quote "${alt_quote1}" "${author1}"
		fi
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
