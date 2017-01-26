#!/bin/sh
cd ~
echo "Please choose the way you want to run Nadeko."

choice=3
    echo "1. Run Nadeko (Normally)"
    echo "2. Run nadeko with Auto Restart (Use normal start first before using this.)"

while [ $choice -eq 3 ]; do
read choice
if [ $choice -eq 1 ] ; then
			echo ""
			echo "Running Nadeko Normally, if you are running this to check Nadeko, use .die command on discord to stop Nadeko."
			curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_run.sh | sh
			echo ""
			echo "Welcome back to NadekoBot."
			bash linuxAIO.sh
		else
			if [ $choice -eq 2 ] ; then
				echo ""
				echo "Running Nadeko with Auto Restart you will have to close the session to stop the auto restart."
				sleep 5s
				wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/master/NadekoAutoRestartAndUpdate.sh && bash NadekoAutoRestartAndUpdate.sh
				echo ""
				echo "Looks like that didn't work."
        fi
fi
done
exit 0
