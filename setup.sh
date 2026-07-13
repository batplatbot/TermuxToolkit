
-
#!/usr/bin/env bash

# Ω_BLACKSTAR – Termux Setup Script
# Version: 2.0
# Author: Ω_BLACKSTAR
# Description: Interactive installer for 20+ Termux tools

# ============================================================
# COLORS
# ============================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# ============================================================
# LOGO
# ============================================================
show_logo() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║                                                                  ║"
    echo "║   ██████╗ ███████╗██████╗ ██████╗  █████╗ ██████╗ ██████╗       ║"
    echo "║   ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚════██╗      ║"
    echo "║   ██████╔╝█████╗  ██████╔╝██████╔╝███████║██████╔╝ █████╔╝      ║"
    echo "║   ██╔═══╝ ██╔══╝  ██╔══██╗██╔══██╗██╔══██║██╔══██╗ ╚═══██╗      ║"
    echo "║   ██║     ███████╗██║  ██║██████╔╝██║  ██║██████╔╝██████╔╝      ║"
    echo "║   ╚═╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═════╝       ║"
    echo "║                                                                  ║"
    echo "║              Ω_BLACKSTAR – Termux Setup v2.0                      ║"
    echo "║              https://github.com/YOUR_USERNAME/TermuxSetup        ║"
    echo "╚══════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# ============================================================
# FUNCTIONS
# ============================================================
install_tool() {
    local tool="$1"
    local pkg="$2"
    echo -e "${YELLOW}[*] Installing $tool...${NC}"
    pkg install -y "$pkg" 2>/dev/null || echo -e "${RED}[!] Failed to install $tool.${NC}"
}

install_python_tool() {
    local tool="$1"
    local pip_pkg="$2"
    echo -e "${YELLOW}[*] Installing $tool (Python)...${NC}"
    pip install --upgrade "$pip_pkg" 2>/dev/null || echo -e "${RED}[!] Failed to install $tool.${NC}"
}

install_git_repo() {
    local repo_name="$1"
    local repo_url="$2"
    echo -e "${YELLOW}[*] Cloning $repo_name...${NC}"
    git clone "$repo_url" "$HOME/$repo_name" 2>/dev/null || echo -e "${RED}[!] Failed to clone $repo_name.${NC}"
}

# ============================================================
# MENU OPTIONS
# ============================================================
option_1() { echo -e "${GREEN}[+] Updating and upgrading system...${NC}"; pkg update && pkg upgrade -y; }
option_2() { echo -e "${GREEN}[+] Installing Python & Pip...${NC}"; pkg install -y python python-pip; }
option_3() { install_tool "Nmap" "nmap"; }
option_4() { install_tool "Git" "git"; }
option_5() { install_tool "Termux API" "termux-api"; }
option_6() { echo -e "${YELLOW}[*] Installing Metasploit Framework (this may take a while)...${NC}"; pkg install -y unstable-repo && pkg install -y metasploit; }
option_7() { install_tool "Hydra" "hydra"; }
option_8() { install_tool "SQLmap" "sqlmap"; }
option_9() { echo -e "${YELLOW}[*] Installing Recon-ng...${NC}"; git clone https://github.com/lanmaster53/recon-ng "$HOME/recon-ng"; cd "$HOME/recon-ng" && pip install -r requirements.txt; }
option_10() { echo -e "${YELLOW}[*] Installing theHarvester...${NC}"; git clone https://github.com/laramies/theHarvester "$HOME/theHarvester"; cd "$HOME/theHarvester" && pip install -r requirements.txt; }
option_11() { echo -e "${YELLOW}[*] Installing SocialFish (Phishing)...${NC}"; git clone https://github.com/UndeadSec/SocialFish "$HOME/SocialFish"; cd "$HOME/SocialFish" && pip install -r requirements.txt; }
option_12() { echo -e "${YELLOW}[*] Installing HiddenEye (Phishing)...${NC}"; git clone https://github.com/DarkSecDevelopers/HiddenEye "$HOME/HiddenEye"; cd "$HOME/HiddenEye" && pip install -r requirements.txt; }
option_13() { echo -e "${YELLOW}[*] Installing Ngrok...${NC}"; pkg install -y ngrok; }
option_14() { echo -e "${YELLOW}[*] Installing Cloudflared...${NC}"; pkg install -y cloudflared; }
option_15() { echo -e "${YELLOW}[*] Installing IP-Tracer...${NC}"; git clone https://github.com/rajkumardusad/IP-Tracer "$HOME/IP-Tracer"; cd "$HOME/IP-Tracer" && bash install.sh; }
option_16() { install_tool "WHOIS" "whois"; }
option_17() { install_tool "OpenSSL" "openssl"; }
option_18() { install_tool "Curl" "curl"; }
option_19() { install_tool "Wget" "wget"; }
option_20() {
    echo -e "${GREEN}[+] Installing ALL tools...${NC}"
    for i in {1..19}; do
        option_$i
    done
    echo -e "${GREEN}[+] All tools installed!${NC}"
}

# ============================================================
# MAIN MENU
# ============================================================
show_menu() {
    show_logo
    echo -e "${WHITE}Select an option:${NC}"
    echo -e " ${CYAN}1.${NC} Update & Upgrade System"
    echo -e " ${CYAN}2.${NC} Install Python & Pip"
    echo -e " ${CYAN}3.${NC} Install Nmap"
    echo -e " ${CYAN}4.${NC} Install Git"
    echo -e " ${CYAN}5.${NC} Install Termux API"
    echo -e " ${CYAN}6.${NC} Install Metasploit Framework"
    echo -e " ${CYAN}7.${NC} Install Hydra"
    echo -e " ${CYAN}8.${NC} Install SQLmap"
    echo -e " ${CYAN}9.${NC} Install Recon-ng"
    echo -e " ${CYAN}10.${NC} Install theHarvester"
    echo -e " ${CYAN}11.${NC} Install SocialFish (Phishing)"
    echo -e " ${CYAN}12.${NC} Install HiddenEye (Phishing)"
    echo -e " ${CYAN}13.${NC} Install Ngrok"
    echo -e " ${CYAN}14.${NC} Install Cloudflared"
    echo -e " ${CYAN}15.${NC} Install IP-Tracer"
    echo -e " ${CYAN}16.${NC} Install WHOIS"
    echo -e " ${CYAN}17.${NC} Install OpenSSL"
    echo -e " ${CYAN}18.${NC} Install Curl"
    echo -e " ${CYAN}19.${NC} Install Wget"
    echo -e " ${CYAN}20.${NC} ${GREEN}Install ALL Tools (Bulk)${NC}"
    echo -e " ${CYAN}0.${NC} ${RED}Exit${NC}"
    echo
    read -p "Enter your choice: " choice

    case $choice in
        1) option_1 ;;
        2) option_2 ;;
        3) option_3 ;;
        4) option_4 ;;
        5) option_5 ;;
        6) option_6 ;;
        7) option_7 ;;
        8) option_8 ;;
        9) option_9 ;;
        10) option_10 ;;
        11) option_11 ;;
        12) option_12 ;;
        13) option_13 ;;
        14) option_14 ;;
        15) option_15 ;;
        16) option_16 ;;
        17) option_17 ;;
        18) option_18 ;;
        19) option_19 ;;
        20) option_20 ;;
        0) echo -e "${RED}[!] Exiting...${NC}"; exit 0 ;;
        *) echo -e "${RED}[!] Invalid option.${NC}"; sleep 2; show_menu ;;
    esac

    echo
    read -p "Press [Enter] to return to the menu..."
    show_menu
}

# ============================================================
# START
# ============================================================
