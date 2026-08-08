#!/bin/bash

set -e

VERSION="0.4"

#===============================================
#					Functions
#===============================================


print_header(){

	echo "*********************************"
	echo "Linux Administration Toolkit v$VERSION"
	echo "*********************************"
	echo

}


print_menu() {

	echo "1) Show Current User"

	echo "2) Show User ID"

	echo "3) Show Groups"

	echo "4) Show Hostname"

	echo "5) Show Running Services"

	echo "6) Show Faild Services"

	echo "7) Show User Information"

	echo "8) Show Group Information"

	echo "9) Exit"

	echo

}


#===============================================
#					Main
#===============================================



print_header
print_menu

read -p "select option:" option

case "$option" in
1)
	echo "Current User:"
	whoami
	;;

2)
	echo "User Id:"
	id | cut -d " " -f1
	;;

3)
	echo "Groups:"
	groups
	;;

4)
	echo "Hostname:"
	hostname
	;;

5)
	echo "Show Running Services:"
	systemctl list-units --type service --state=running
	;;

6)
	echo "Show Failed Services:"
	systemctl list-units --failed
	;;

7)	
	read -p "Enter username: " username
	if id $username > /dev/null 2>&1 ; then
	id "$username"
	else
		echo "user not found"
	fi
	;;

8)

	read -p "Enter group name: " group
	if getent group "$group" >/dev/null 2>&1 ; then
    getent group "$group"
	else
		echo "Group not found"
	fi
	;;
	
9)
	echo "bye :)"
	exit
	;;

*)
	echo "Invalid option!"

esac

