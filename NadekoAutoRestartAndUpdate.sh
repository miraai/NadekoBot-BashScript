#!/bin/sh
echo ""
echo "Welcome to NadekoBot Auto Restart and Update!"
echo ""

choice=4
	echo "1. Run Auto Restart normally without updating NadekoBot."
	echo "2. Run Auto Restart and update NadekoBot."
	echo "3. Exit"
	echo -n "Choose [1] to Run NadekoBot with auto restart on "die" command without updating itself, [2] to Run with Auto Updating on restart after using "die" command."
while [ $choice -eq 4 ]; do
read choice
if [ $choice -eq 1 ] ; then
	echo ""
	curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/1.4/NadekoARN.sh | sh
else
	if [ $choice -eq 2 ] ; then
		echo ""
		curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/1.4/NadekoARU_Latest.sh | sh
	else
			if [ $choice -eq 3 ] ; then
				echo ""
				echo "Exiting..."
				exit 0
			else
				clear
				echo "1. Auto Restart normally without updating NadekoBot."
				echo "2. Auto Restart and update NadekoBot."
				echo "3. Exit"
				echo -n "Choose [1] to Run NadekoBot with auto restart on "die" command without updating itself, [2] to Run with Auto Updating on restart after using "die" command."
				choice=4
			fi
		
	fi
fi
done
exit 0
