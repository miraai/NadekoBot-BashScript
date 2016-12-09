#!/bin/sh
echo ""
echo "Welcome to NadekoBot."

choice=6
	echo "1. Download Dev Build (latest)"
	echo "2. Download Stable Build"
	echo "3. Run Nadeko (normally)"
	echo "4. Run Nadeko with Auto Restart (check if nadeko is working properly, before using this)"
	echo "5. To exit"
	echo -n "Choose [1 or 2] to Download [3 or 4] to Run."
while [ $choice -eq 6 ]; do
read choice
if [ $choice -eq 1 ] ; then

	echo ""
	echo "Downloading NadekoBot, please wait."
	curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_installer_latest.sh | sh
	echo ""
	echo "NadekoBot Dev Build (latest) downloaded."
	bash linuxAIO.sh
else
	if [ $choice -eq 2 ] ; then
		echo ""
		echo "Downloading NadekoBot, please wait."
		curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_installer.sh | sh
		echo ""
		echo "NadekoBot Stable Build downloaded."
		bash linuxAIO.sh
	else
		if [ $choice -eq 3 ] ; then
			echo ""
			echo "Running Nadeko Normally, if you are running this to check Nadeko, use .die command on discord to stop Nadeko."
			curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_run.sh | sh
			echo ""
			echo "Welcome back to NadekoBot."
			bash linuxAIO.sh
		else
			if [ $choice -eq 4 ] ; then
				echo ""
				echo "Running Nadeko with Auto Restart you will have to close the session to stop the auto restart."
				sleep 5s
				wget -N https://github.com/samdivaio/NadekoBot-BashScript/raw/master/NadekoAutoRestartAndUpdate.sh && bash NadekoAutoRestartAndUpdate.sh
				echo ""
				echo "Looks like that didn't work."
			else
				if [ $choice -eq 5 ] ; then
					echo ""
					echo "Exiting..."
					exit 0
				else
					echo "1. Download Dev Build (latest)"
					echo "2. Download Stable Build"
					echo "3. Run Nadeko (normally)"
					echo "4. Run Nadeko with Auto Restart (check if nadeko is working properly, before using this)"
					echo "5. To exit"
					echo -n "Choose [1 or 2] to Download [3 or 4] to Run."
					choice=6
				fi
			fi
		fi
	fi
fi
done
exit 0
