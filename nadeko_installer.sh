#!/bin/sh
printf "\nNadekoBot Installer started.\n\n"

if hash git 1>/dev/null 2>&1
then
    printf "Git Installed.\n\n"
else
    printf "Git is not installed. Please install Git.\n\n"
    exit 1
fi


if hash dotnet 1>/dev/null 2>&1
then
    printf "Dotnet installed.\n\n"
else
    printf "Dotnet is not installed. Please install dotnet.\n\n"
    exit 1
fi

root=$(pwd)
tempdir=NadekoInstall_Temp

rm -r "$tempdir" 1>/dev/null 2>&1
mkdir "$tempdir"
cd "$tempdir"

printf "Downloading NadekoBot, please wait.\n\n"
git clone -b 1.0 --recursive --depth 1 https://github.com/Kwoth/NadekoBot.git
printf "NadekoBot downloaded.\n\n"

printf "Downloading Nadeko dependencies\n\n"
cd $root/$tempdir/NadekoBot/discord.net/src/Discord.Net
dotnet restore 1>/dev/null 2>&1
cd $root/$tempdir/NadekoBot/discord.net/src/Discord.Net.Commands
dotnet restore 1>/dev/null 2>&1
cd $root/$tempdir/NadekoBot/src/NadekoBot/
dotnet restore 1>/dev/null 2>&1
printf "Download done\n\n"

printf "Building NadekoBot\n\n"
cd $root/$tempdir/NadekoBot/src/NadekoBot/
dotnet build --configuration Release 1>/dev/null 2>&1
printf "Building done. Moving Nadeko\n\n"

cd "$root"

if [ ! -d NadekoBot ]
then
    mv "$tempdir"/NadekoBot NadekoBot
else
    rm -rf NadekoBot_old 1>/dev/null 2>&1
    mv -fT NadekoBot NadekoBot_old 1>/dev/null 2>&1
    mv $tempdir/NadekoBot NadekoBot
    cp -f $root/NadekoBot_old/src/NadekoBot/credentials.json $root/NadekoBot/src/NadekoBot/credentials.json 1>/dev/null 2>&1
    printf "credentials.json copied to the new version\n\n"
    cp -RT $root/NadekoBot_old/src/NadekoBot/bin/ $root/NadekoBot/src/NadekoBot/bin/ 1>/dev/null 2>&1
    printf "Database copied to the new version\n\n"
    cp -RT $root/NadekoBot_old/src/NadekoBot/data/ $root/NadekoBot/src/NadekoBot/data/ 1>/dev/null 2>&1
    printf "Other data copied to the new version\n\n"
fi

rm -r "$tempdir"
printf "Installation Complete.\n\n"
exit 0
