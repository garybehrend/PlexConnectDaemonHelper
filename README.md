A little helper script for PlexConnect when running as a Daemon on OS X.

Clone the repository, or download the zip file and expand it.

I usually copy the PlexConnectDaemonHelper.bash file into /usr/bin/ so it is accessible from anywhere on the command line
You will also need to use the 'sudo chmod +x PlexConnectDaemonHelper.bash' command to provide execute permissions to the file.

Usage:
Issue the command "PlexConnectDaemonHelper.bash" from the Terminal. You will be prompted to enter a local administrator users' password, this will typically be the password for the account you are currently using.

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