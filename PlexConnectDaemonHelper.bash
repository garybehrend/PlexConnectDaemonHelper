#!/bin/bash
my_script_version="1.0.2"
my_script_name=`basename $0 | cut -d'.' -f1`

path_to_PlexConnect_Log_File="/Applications/PlexConnect-master/PlexConnect.log"


function the_main_code()
{

	echo ""
	echo "You will be prompted to enter a password for an Administrator user."
	echo "This will usually be the password for your User account"
	echo ""

	current_plexconnect_status=`sudo launchctl list | grep plexconnect`

	if [ "$current_plexconnect_status" != "" ]
	then
		# Plex Connect Daemon is running.
		plexconnect_daemon_status
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
		1) stop_plexconnect_daemon;;
		2) exit 1;;
		*) exit 1;;
		esac

	else

		# Plex Connect Daemon is not running.
		plexconnect_daemon_status
		echo ""
		echo "Please select an option. Pressing return will exit"
		echo "You may be prompted to enter and Administrator User password"
		echo ""
		echo "1. Start the PlexConnect Daemon"
		echo "2. Exit"
		echo ""
		read opt
		case $opt in
		1) start_plexconnect_daemon;;
		2) exit 1;;
		*) exit 1;;
		esac


	fi
	
	echo ""
}


function start_plexconnect_daemon()
{

	start_plexconnect_status=`sudo launchctl list | grep plexconnect`
	if [ "$start_plexconnect_status" != "" ]
	then
	
		plexconnect_daemon_status
		
	else
		sudo launchctl load /Library/LaunchDaemons/com.plex.plexconnect.bash.plist
		echo "Starting PlexConnect Daemon"
		echo ""
		new_plexconnect_status=`sudo launchctl list | grep plexconnect`
		if [ "$new_plexconnect_status" != "" ]
		then

			# wait 5 seconds
			echo "Waiting 5 seconds..."
			sleep 5

			echo "PlexConnect has been started as:"
			echo "$new_plexconnect_status"
			echo ""
			echo "Status:"
			echo ""
			head -25 "$path_to_PlexConnect_Log_File"
			echo ""

		else

			echo "ERROR! PlexConnect could not start"

		fi
		
	fi

}


	
function stop_plexconnect_daemon()
{

	
	stop_plexconnect_status=`sudo launchctl list | grep plexconnect`
	if [ "$stop_plexconnect_status" != "" ]
	then
		sudo launchctl unload /Library/LaunchDaemons/com.plex.plexconnect.bash.plist
		echo "Stopping PlexConnect Daemon"

		echo ""
		new_plexconnect_status=`sudo launchctl list | grep plexconnect`
		if [ "$new_plexconnect_status" != "" ]
		then

			# wait 5 seconds
			echo "Waiting 5 seconds..."
			sleep 5

			echo "PlexConnect has been started as:"
			echo "$new_plexconnect_status"
			echo ""
			echo "Status:"
			echo ""
			head -25 "$path_to_PlexConnect_Log_File"
			echo ""

		else

			echo "PlexConnect has been stopped"

		fi

		echo ""
		
	else
	echo ""
	echo "PlexConnect could not be stopped as it is not running"
	echo ""
	
	fi
}


function plexconnect_daemon_status()
{
	current_plexconnect_status=`sudo launchctl list | grep plexconnect`
	if [ "$current_plexconnect_status" != "" ]
	then
		# Plex Connect Daemon is running.
		echo ""
		echo "PlexConnect is running as:"
		echo "$current_plexconnect_status"
		echo ""
		echo "Status:"
		echo ""
		head -25 "$path_to_PlexConnect_Log_File"

	else

		# Plex Connect Daemon is not running.
		echo ""
		echo "PlexConnect is not running:"
		echo ""
	fi
}



# Check if the script has been called with any parameters
clear

echo ""
echo "---- $my_script_name v$my_script_version ----"
echo ""


if [ "$1" == "start" ]
then
	start_plexconnect_daemon

elif [ "$1" == "stop" ]
then
	stop_plexconnect_daemon

elif [ "$1" == "status" ]
then

	plexconnect_daemon_status

elif [ "$1" == "" ]
then

	the_main_code
else
exit 1

fi

echo ""
