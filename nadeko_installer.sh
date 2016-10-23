#!/bin/sh
echo "NadekoBot Installer started."

if hash git &>/dev/null
then
    echo "Git Installed."
else
    echo "Git is not installed. Please install Git."
    exit 1
fi


if hash dotnet &>/dev/null
then
    echo "Dotnet installed."
else
    echo "Dotnet is not installed. Please install dotnet."
    exit 1
fi

root=$(pwd)
tempdir=NadekoInstall_Temp

rm -r "$tempdir" &>/dev/null
mkdir "$tempdir"
cd "$tempdir"

echo "Downloading NadekoBot, please wait."
git clone -b 1.0 --recursive --depth 1 https://github.com/Kwoth/NadekoBot.git
echo "NadekoBot downloaded."

echo "Downloading Nadeko dependencies"
cd NadekoBot
dotnet restore &>/dev/null
echo "Download done"

echo "Building NadekoBot"
cd src/NadekoBot/
dotnet build --configuration Release &>/dev/null
echo "Building done. Moving Nadeko"

cd "$root"

if [ ! -d NadekoBot ]
then
    mv "$tempdir"/NadekoBot NadekoBot
else
    rm -rf NadekoBot_old &>/dev/null
    mv -fT NadekoBot NadekoBot_old &>/dev/null
    mv $tempdir/NadekoBot NadekoBot
    cp -f $root/NadekoBot_old/src/NadekoBot/credentials.json "$root"/NadekoBot/srcnano /NadekoBot/credentials.json &>/dev/null
    echo "credentials.json copied to the new version"
    cp -RT $root/NadekoBot_old/src/NadekoBot/bin/ $root/NadekoBot/src/NadekoBot/bin/ &>/dev/null
    echo "Database copied to the new version"
    cp -RT $root/NadekoBot_old/src/NadekoBot/data/ $root/NadekoBot/src/NadekoBot/data/ &>/dev/null
    echo "Other data copied to the new version"
fi

rm -r "$tempdir"
echo "Installation Complete."
exit 0
