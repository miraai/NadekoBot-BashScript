#!/bin/sh
echo ""
echo "Running NadekoBot with auto restart and updating to stable build!"
sleep 5s
while :; do cd NadekoBot dotnet restore && dotnet build --configuration Release && cd- && NadekoBot/src/NadekoBot && dotnet run -c Release && cd - && curl -L https://github.com/samdivaio/NadekoBot-BashScript/raw/1.4/nadeko_installer.sh | sh; sleep 5s; done
echo ""
echo "That didn't work? Please report in #NadekoLog Discord Server."
sleep 3s
bash linuxAIO.sh
echo "Done"
exit 0
