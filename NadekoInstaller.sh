#!/bin/bash
  echo "NadekoBot 1.0 Download"
  echo "Mirai was here."
  if git 2>&1 >/dev/null; 
  then echo "Git Installed." 
  else echo "Git is not installed. Please install Git." | exit 1
  if dotnet 2>&1 >/dev/null; 
  then echo "Dotnet installed." 
  else echo "Dotnet is not installed. Please install dotnet." | exit 1
  mkdir NadekoInstall_Temp
  echo "Created NadekoBot-temp folder"
  cd NadekoInstall_Temp
  echo "Downloading NadekoBot, please wait."
  git clone -b 1.0 --recursive -v https://github.com/Kwoth/NadekoBot.git
  echo "NadekoBot downloaded."
  cd NadekoInstall_Temp\NadekoBot\
  dotnet restore >nul 2>&1
  cd NadekoInstall_Temp\NadekoBot\src\NadekoBot\
  echo "Building NadekoBot"
  dotnet build --configuration Release
  echo "Setting up NadekoBot"
  dotnet build --configuration Release
  echo "Done. You can close the window."
exit 0
