#!/bin/sh
echo ""
echo "Running NadekoBot with auto restart and updating to latest build!"
sleep 5s
while :; do cd NadekoBot && dotnet restore && dotnet build --configuration Release && cd - && cd NadekoBot/src/NadekoBot && dotnet run -c Release && cd - && curl -L https://github.com/Kwoth/NadekoBot-BashScript/raw/1.4/nadeko_installer_latest.sh | sh; sleep 5s; done
echo ""
echo "That didn't work? Please report in #NadekoLog Discord Server."
sleep 3s
bash linuxAIO.sh
echo "Done"
exit 0
