#!/bin/bash
if [ "$1" == "" ]
then
	echo " [*] SUBDOMAIN FINDER FROM SSL CERTIFICATES [*] " 
	echo " $0 www.exemplo.com.br"
	exit 0
else
	mkdir $1
	cd "$(pwd)/$1"

	lynx --dump "https://crt.sh/?q=$1" | grep ".$1" | grep -oP '[a-z0-9]+\.[a-z]+\.[a-z]+' | sort | uniq > subaux

	for url in $(cat subaux); do
		
		host $url | grep -v "NXDOMAIN" >> subdominios
		host $url | grep -v "NXDOMAIN" 
	done
	rm -r subaux
	
fi
