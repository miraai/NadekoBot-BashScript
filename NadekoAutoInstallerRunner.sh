#!/bin/sh
cd ~
echo "Please choose which version you want to install."

choice=3
    echo "1. Download Dev Build (Latest)"
    echo "2. Download Stable Build"
while [ $choice -eq 3 ]; do
read choice
if [ $choice -eq 1 ] ; then

	echo ""
	echo "Downloading NadekoBot, please wait."
	curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_installer_latest.sh | sh
	echo ""
	echo "NadekoBot Dev Build (Latest) downloaded."
    echo "Almost done! When you continue, we will pull up a text editor to edit your credentials.json. Please follow the guide on how to set this up. When you're finished, press Ctrl + X, then Y and Enter, then Enter again."
    read -n 1 -s -p "Press any key to continue"
    nano ~/NadekoBot/src/NadekoBot/credentials.json
	wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/master/NadekoRun.sh
	bash ~/NadekoRun.sh
else
	if [ $choice -eq 2 ] ; then
		echo ""
		echo "Downloading NadekoBot, please wait."
		curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_installer.sh | sh
		echo ""
		echo "NadekoBot Stable Build downloaded."
        echo "Almost done! When you continue, we will pull up a text editor to edit your credentials.json. Please follow the guide on how to set this up. When you're finished, press Ctrl + X, then Y and Enter, then Enter again."
        read -n 1 -s -p "Press any key to continue"
        nano ~/NadekoBot/src/NadekoBot/credentials.json
		wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/master/NadekoRun.sh
		bash ~/NadekoRun.sh
    fi
fi
done
exit 0
