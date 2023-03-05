#!/bin/bash
sudo pacman -Syu git mpg123 python-pip
pip install langdetect
cd ~/ && git clone https://aur.archlinux.org/python-gtts.git && cd python-gtts/ && makepkg -sif --clean

echo "
function chatgpt() {
  local answer=\$(sgpt --no-animation \"\$*\")
  echo \"\$answer\"
  language=\$(echo \"\$*\" | python -c \"from langdetect import detect; print(detect('\$*'))\" 2>/dev/null)
  gtts-cli -l \"\$language\" \"\$answer\" --output tts.mp3
  mpg123 -q ~/tts.mp3
}
" >> ~/.bashrc && source ~/.bashrc
