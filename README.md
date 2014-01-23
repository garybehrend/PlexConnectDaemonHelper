A little helper script for PlexConnect when running as a Daemon on OS X.

Clone the repository, or download the zip file and expand it.

I usually copy the PlexConnectDaemonHelper.bash file into /usr/bin/ so it is accessible from anywhere on the command line
You will also need to use the 'sudo chmod +x PlexConnectDaemonHelper.bash' command to provide execute permissions to the file.

Requirements:
The helper script assumes that PlexConnect is located within a folder named PlexConnect-master which is within the Applications folder. This is because it displays a portion of the PlexConnect.log file. You can modify the script to change the path to this folder if you wish.

Usage:
If you simply envoke the helper script with it's name; "PlexConnectDaemonHelper.bash" then it will start up in interactive mode

If the PlexConnect Daemon is running then it will display the process number of the running instance. It will also show a brief status of PlexConnect.

You then have two options:
1. Stop the daemon from running 
2. Exit the script

Pressing 1 will stop PlexConnect from running.
Pressing 2 will exit the helper script without making any changes

If the PlexConnect Daemon is not running then it will present two options
1. Start the PlexConnect Daemon
2. Exit

Pressing 1 will start PlexConnect, you will also see a brief status indication
Pressing 2 will exit the script without making any changes

The script also supports you supplying command line arguments to it, they are; start, stop, and status.

If you issue the command "PlexConnectDaemonHelper.bash status" then the staus of the PlexConnect Daemon will be returned

If you issue the command "PlexConnectDaemonHelper.bash stop" then the PlexConnect Daemon will be stopped if it is running.

If you issue the command "PlexConnectDaemonHelper.bash start" then the PlexConnect Daemon will be started if it is not running.

Tested on OS X 10.9.1
