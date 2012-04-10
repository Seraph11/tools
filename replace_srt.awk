#!/usr/bin/awk -f
BEGIN{}
{
	if(NR >53 && $1 ~ /^[1-9][0-9]*?/) 
		print $1+3 
	else 
		print $0 
} 