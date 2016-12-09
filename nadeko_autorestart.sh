#!/bin/sh
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
curl -L https://github.com/samdivaio/NadekoBot-BashScript/raw/master/NadekoARN.sh | sh
else
if [ $choice -eq 2 ] ; then
echo ""
curl -L https://github.com/samdivaio/NadekoBot-BashScript/raw/master/NadekoARU_Latest.sh | sh
else
if [ $choice -eq 3 ] ; then
echo ""
curl -L https://github.com/samdivaio/NadekoBot-BashScript/raw/master/NadekoARU_Stable.sh | sh
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
