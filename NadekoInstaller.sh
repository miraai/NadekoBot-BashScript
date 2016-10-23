#!/bin/sh

echo "NadekoBot 1.0 Download"
echo "Mirai was here."

if hash git 2>/dev/null
then
	echo "Git Installed."
else
	echo "Git is not installed. Please install Git."
	exit 1
fi

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

root=$(pwd)

rm -r NadekoInstall_Temp 2>/dev/null
mkdir NadekoInstall_Temp
cd NadekoInstall_Temp
echo "Created NadekoBot-temp folder"

echo "Downloading NadekoBot, please wait."
git clone -b 1.0 --recursive --depth 1 https://github.com/Kwoth/NadekoBot.git
echo "NadekoBot downloaded."


echo "Downloading Nadeko dependencies"
cd NadekoBot
dotnet restore >nul 2>&1
echo "Download done"

echo "Building NadekoBot"
cd src/NadekoBot/
dotnet build --configuration Release

echo "Building done. Moving Nadeko"

cd "$root"
if [ ! -d NadekoBot ]
then
	mkdir NadekoBot.backup 2>/dev/null
else
	echo "Backing up old Nadeko"
	mv --backup=numbered NadekoBot NadekoBot.backup
fi

mv NadekoInstall_Temp/NadekoBot NadekoBot
rm -r NadekoInstall_Temp

echo "Done."

exit 0