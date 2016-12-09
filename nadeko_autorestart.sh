#!/bin/sh

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

echo ""
echo "Welcome to NadekoBot Auto Restart and Update!"

choice=5
	echo "1. Run Auto Restart without Updating."
	echo "2. Auto Restart and Update with Dev Build (latest)"
	echo "3. Auto Restart and Update with Stable Build"
	echo "4. Exit"
	echo -n "Choose 1 for runing NadekoBot to auto restart on ".die" command without updating itself, [2 or 3] to Run with Auto Updating and Restarting after using ".die" command."
while [ $choice -eq 5 ]; do
read choice

if [ $choice -eq 1 ] ; then
	echo ""
	echo "
	cd NadekoBot/src/NadekoBot
	echo "Running NadekoBot with auto restart and without updating!"
	sleep 3s
	while :; do dotnet run -c Release; sleep 5s; done
	echo "Done"
else
	if [ $choice -eq 2 ] ; then
		echo ""
		echo "Running NadekoBot with auto restart and updating to latest build!"
		sleep 5s
		while :; do cd NadekoBot/src/NadekoBot && dotnet run -c Release && cd - && curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_installer_latest.sh | sh; sleep 5s; done
		echo ""
		echo "That didn't work? Please report in #NadekoLog Discord Server."
		sleep 3s
		bash linuxAIO.sh
	else
		if [ $choice -eq 3 ] ; then
			echo ""
			echo "Running NadekoBot with auto restart and updating to stable build!"
			while :; do cd NadekoBot/src/NadekoBot && dotnet run -c Release && cd - && curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_installer.sh | sh; sleep 5s; done
			echo ""
			echo "That didn't work? Please report in #NadekoLog Discord Server."
			sleep 3s
			bash linuxAIO.sh
		else
			if [ $choice -eq 4 ] ; then
				echo ""
				echo "Exiting..."
				exit 0
			else
				echo "1. Run Auto Restart without Updating."
				echo "2. Auto Restart and Update with Dev Build (latest)"
				echo "3. Auto Restart and Update with Stable Build"
				echo "4. Exit"
				echo -n "Choose [1] for running NadekoBot with auto restart on ".die" command without updating itself [2 or 3] to Run with Auto Updating and Restarting after using ".die" command."
				choice=5
			fi
		fi
	fi
fi
done
exit 0
