#!/bin/sh
echo ""
echo "Running NadekoBot with auto restart and updating to latest build!"
sleep 5s
echo "while :; do cd NadekoBot/src/NadekoBot && dotnet run -c Release && cd - && curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_installer_latest.sh | sh; sleep 5s; done"
echo ""
cd NadekoBot/src/NadekoBot && dotnet run -c Release && cd - && curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/master/nadeko_installer_latest.sh | sh
echo "That didn't work? Please report in #NadekoLog Discord Server."
sleep 3s
bash linuxAIO.sh
echo "Done"
exit 0
