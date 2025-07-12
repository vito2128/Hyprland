#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for prerequisites section"
print_info "\nStarting prerequisites setup..."

run_command "pacman -Syyu --noconfirm" "Update package database and upgrade packages (Recommended)" "yes" # no

if run_command "pacman -S --noconfirm --needed git base-devel" "Install PARU (Must)/Breaks the script" "yes"; then # 
    run_command "git clone https://aur.archlinux.org/paru.git && cd paru" "Clone PARU (Must)/Breaks the script" "no" "no" 
    run_command "makepkg --noconfirm -si && cd .. # builds with makepkg" "Build PARU (Must)/Breaks the script" "no" "no" 
fi
run_command "pacman -S --noconfirm pipewire wireplumber pamixer pavucontrol brightnessctl" "Configuring audio and brightness (Recommended)" "yes" 

run_command "pacman -S --noconfirm ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono" "Installing Nerd Fonts and Symbols (Recommended)" "yes" 

run_command "pacman -S --noconfirm ly && systemctl enable ly.service" "Install and enable LY" "yes"

run_command "pacman -S --noconfirm firefox" "Install Firefox Browser" "yes" "no" 

run_command "pacman -S --noconfirm kitty" "Install Kitty (Recommended)" "yes"

run_command "pacman -S --noconfirm nano" "Install nano" "yes"

run_command "pacman -S --noconfirm tar" "Install tar for extracting files (Must)/needed for copying themes" "yes"

echo "------------------------------------------------------------------------"