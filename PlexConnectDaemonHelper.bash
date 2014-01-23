#!/bin/bash

my_script_name=`basename $0 | cut -d'.' -f1`

	clear

	echo ""
	echo "---- $my_script_name v1.0.1 ----"
	echo ""

	echo ""
	echo "You will be prompted to enter a password for an Administrator user."
	echo "This will usually be the password for your User account"
	echo ""

	current_plexconnect_status=`sudo launchctl list | grep plexconnect`

	if [ "$current_plexconnect_status" != "" ]
	then
		# Plex Connect Daemon is running.
		echo "PlexConnect is running as:"
		echo "$current_plexconnect_status"
		echo ""
		echo "Status:"
		echo ""
		head -25 /Applications/PlexConnect-master/PlexConnect.log
		echo ""
		echo ""
		echo "Please select an option. Pressing return will exit"
		echo "You may be prompted to enter and Administrator User password"
		echo ""
		echo "1. Stop the PlexConnect Daemon"
		echo "2. Exit"
		echo ""
		read opt
		case $opt in
		1) sudo launchctl unload /Library/LaunchDaemons/com.plex.plexconnect.bash.plist
		echo "Stopping PlexConnect Daemon";;
		2) exit 1;;
		*) exit 1;;
		esac

	else

		# Plex Connect Daemon is not running.
		echo "PlexConnect is not running:"
		echo ""
		echo "Please select an option. Pressing return will exit"
		echo "You may be prompted to enter and Administrator User password"
		echo ""
		echo "1. Start the PlexConnect Daemon"
		echo "2. Exit"
		echo ""
		read opt
		case $opt in
		1) sudo launchctl load /Library/LaunchDaemons/com.plex.plexconnect.bash.plist
		echo "Starting PlexConnect Daemon";;
		2) exit 1;;
		*) exit 1;;
		esac


	fi

	echo ""
	new_plexconnect_status=`sudo launchctl list | grep plexconnect`
	if [ "$new_plexconnect_status" != "" ]
	then

		# wait 10 seconds
		echo "Waiting 5 seconds..."
		sleep 5

		echo "PlexConnect has been started as:"
		echo "$new_plexconnect_status"
		echo ""
		echo "Status:"
		echo ""
		head -25 /Applications/PlexConnect-master/PlexConnect.log
		echo ""

	else

		echo "PlexConnect has been stopped"

	fi

	echo ""

