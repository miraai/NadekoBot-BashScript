#!/bin/bash
  echo "NadekoBot 1.0"
  echo "Mirai was here."
  if git --version 2>&1 >/dev/null; 
  then echo "Git Installed." 
  else echo "Git is not installed. Please install Git." | exit 1
  if dotnet --version 2>&1 >/dev/null; 
  then echo "Dotnet installed." 
  else echo "Dotnet is not installed. Please install dotnet." | exit 1
  cd NadekoBot/src/NadekoBot
  echo "Running NadekoBot. Please wait."
  dotnet run --configuration Release
  echo "Done"
exit 0
