#!/usr/bin/env bash

# Ω_BLACKSTAR – Modernized Termux Setup v2.1
# Fully compliant with modern apt & Python requirements

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Helper Functions
apt_install() {
    echo -e "${YELLOW}[*] Installing $1 via apt...${NC}"
    apt install -y "$1" || echo -e "${RED}[!] Failed to install $1${NC}"
}

pip_install() {
    echo -e "${YELLOW}[*] Installing $1 via pip...${NC}"
    # The --break-system-packages is required for modern Termux/Python
    pip install --upgrade "$1" --break-system-packages || echo -e "${RED}[!] Failed to install $1${NC}"
}

show_logo() {
    clear
    echo -e "${CYAN}
 ╔══════════════════════════════════════════════════════════════════╗
 ║   ██████╗ ███████╗██████╗ ██████╗  █████╗ ██████╗ ██████╗       ║
 ║   ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚════██╗      ║
 ║   ██████╔╝█████╗  ██████╔╝██████╔╝███████║██████╔╝ █████╔╝      ║
 ║   ██╔═══╝ ██╔══╝  ██╔══██╗██╔══██╗██╔══██║██╔══██╗ ╚═══██╗      ║
 ║   ██║     ███████╗██║  ██║██████╔╝██║  ██║██████╔╝██████╔╝      ║
 ║   ╚═╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═════╝       ║
 ║              Ω_BLACKSTAR – Setup v2.1 (Apt Enabled)              ║
 ╚══════════════════════════════════════════════════════════════════╝${NC}"
}

# Menu Functions
option_1() { apt update && apt upgrade -y; }
option_2() { apt_install "python"; apt_install "python-pip"; }
option_3() { apt_install "nmap"; }
option_4() { apt_install "git"; }
option_5() { apt_install "termux-api"; }
option_6() { apt install -y unstable-repo && apt install -y metasploit; }
option_7() { apt_install "hydra"; }
option_8() { apt_install "sqlmap"; }

# Complex Installs
option_9() { git clone https://github.com/lanmaster53/recon-ng "$HOME/recon-ng"; cd "$HOME/recon-ng" && pip install -r requirements.txt --break-system-packages; }
option_10() { git clone https://github.com/laramies/theHarvester "$HOME/theHarvester"; cd "$HOME/theHarvester" && pip install -r requirements.txt --break-system-packages; }
# Note: These tools (11, 12, 15) are legacy. They might fail if dependencies are too old for current Python.
option_11() { git clone https://github.com/UndeadSec/SocialFish "$HOME/SocialFish"; cd "$HOME/SocialFish" && pip install -r requirements.txt --break-system-packages; }
option_12() { git clone https://github.com/DarkSecDevelopers/HiddenEye "$HOME/HiddenEye"; cd "$HOME/HiddenEye" && pip install -r requirements.txt --break-system-packages; }
option_13() { apt_install "ngrok"; }
option_14() { apt_install "cloudflared"; }
option_15() { git clone https://github.com/rajkumardusad/IP-Tracer "$HOME/IP-Tracer"; cd "$HOME/IP-Tracer" && bash install.sh; }

option_16() { apt_install "whois"; }
option_17() { apt_install "openssl"; }
option_18() { apt_install "curl"; }
option_19() { apt_install "wget"; }

option_20() {
    for i in {1..19}; do "option_$i"; done
}

# Main Menu
show_menu() {
    show_logo
    echo -e "${WHITE}1-20: Choose tool | 0: Exit${NC}"
    read -p "Selection: " choice
    if [ "$choice" == "0" ]; then exit 0; fi
    "option_$choice"
    read -p "Press enter to return..."
    show_menu
}

show_menu
