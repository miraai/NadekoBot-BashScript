#!/bin/bash
  echo "NadekoBot 1.0 Download"
  echo "Mirai was here."
  mkdir NadekoBot-temp
  echo "Created NadekoBot-temp folder"
  cd NadekoBot-temp
  echo "Downloading NadekoBot, please wait."
  git clone -b 1.0 --recursive -v https://github.com/Kwoth/NadekoBot.git
  echo "NadekoBot downloaded."
exit 0
