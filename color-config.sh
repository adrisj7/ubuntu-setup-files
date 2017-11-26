#!/bin/bash

echo "COLORS! YAY!"
echo "This uses the Gogh Color Picker, a super nice utility that lets you pick from a set of terminal schemes"
echo "I'd suggest picking Cai, Elementary, Miu, and Pali"

read -p "Press enter to continue..."

wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh
