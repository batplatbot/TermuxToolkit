#!/usr/bin/env bash

# Ω_BLACKSTAR – Modernized Termux Setup v2.2
# Fully compliant with modern apt & Python requirements
# FIXED VERSION - All issues resolved

set -e  # Exit on error

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# Global variables
INSTALL_DIR="$HOME/.termux-tools"
LOG_FILE="$INSTALL_DIR/install.log"

# Create install directory
mkdir -p "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR/logs"

# Helper Functions
log_message() {
    echo -e "$1" | tee -a "$LOG_FILE"
}

apt_install() {
    local package="$1"
    log_message "${YELLOW}[*] Installing $package via apt...${NC}"
    
    if apt install -y "$package" 2>&1 | tee -a "$LOG_FILE"; then
        log_message "${GREEN}[✓] $package installed successfully${NC}"
        return 0
    else
        log_message "${RED}[✗] Failed to install $package${NC}"
        return 1
    fi
}

pip_install() {
    local package="$1"
    log_message "${YELLOW}[*] Installing $package via pip...${NC}"
    
    if python3 -m pip install --upgrade "$package" --break-system-packages 2>&1 | tee -a "$LOG_FILE"; then
        log_message "${GREEN}[✓] $package installed successfully${NC}"
        return 0
    else
        log_message "${RED}[✗] Failed to install $package${NC}"
        return 1
    fi
}

apt_update() {
    log_message "${YELLOW}[*] Updating package lists...${NC}"
    apt update 2>&1 | tee -a "$LOG_FILE"
    
    log_message "${YELLOW}[*] Upgrading packages...${NC}"
    apt upgrade -y 2>&1 | tee -a "$LOG_FILE"
    
    log_message "${GREEN}[✓] System updated${NC}"
}

show_logo() {
    clear
    echo -e "${CYAN}"
    cat << 'EOF'
 ╔══════════════════════════════════════════════════════════════════╗
 ║   ██████╗ ███████╗██████╗ ██████╗  █████╗ ██████╗ ██████╗       ║
 ║   ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚════██╗      ║
 ║   ██████╔╝█████╗  ██████╔╝██████╔╝███████║██████╔╝ █████╔╝      ║
 ║   ██╔═══╝ ██╔══╝  ██╔══██╗██╔══██╗██╔══██║██╔══██╗ ╚═══██╗      ║
 ║   ██║     ███████╗██║  ██║██████╔╝██║  ██║██████╔╝██████╔╝      ║
 ║   ╚═╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═════╝       ║
 ║          Ω_BLACKSTAR – Setup v2.2 (Fixed & Optimized)            ║
 ║                 Professional Termux Toolkit                      ║
 ╚══════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

# ============================================================================
# INSTALLATION FUNCTIONS
# ============================================================================

# [1] Update & Upgrade System
option_1() {
    log_message "${MAGENTA}[1] Updating & Upgrading System...${NC}"
    apt_update
}

# [2] Python & Python-pip
option_2() {
    log_message "${MAGENTA}[2] Installing Python & Pip...${NC}"
    apt_install "python3"
    apt_install "python3-pip"
    pip_install "pip"
    log_message "${GREEN}[✓] Python setup complete${NC}"
}

# [3] Nmap (Network Mapper)
option_3() {
    log_message "${MAGENTA}[3] Installing Nmap...${NC}"
    apt_install "nmap"
}

# [4] Git
option_4() {
    log_message "${MAGENTA}[4] Installing Git...${NC}"
    apt_install "git"
}

# [5] Termux API
option_5() {
    log_message "${MAGENTA}[5] Installing Termux API...${NC}"
    apt_install "termux-api"
}

# [6] Metasploit Framework
option_6() {
    log_message "${MAGENTA}[6] Installing Metasploit...${NC}"
    log_message "${YELLOW}[*] Adding unstable-repo...${NC}"
    apt install -y tur-repo 2>&1 | tee -a "$LOG_FILE"
    apt update 2>&1 | tee -a "$LOG_FILE"
    apt_install "metasploit"
}

# [7] Hydra (Password Cracker)
option_7() {
    log_message "${MAGENTA}[7] Installing Hydra...${NC}"
    apt_install "hydra"
}

# [8] SQLMap
option_8() {
    log_message "${MAGENTA}[8] Installing SQLMap...${NC}"
    apt_install "sqlmap"
}

# [9] Recon-ng
option_9() {
    log_message "${MAGENTA}[9] Installing Recon-ng...${NC}"
    cd "$INSTALL_DIR"
    if [ ! -d "recon-ng" ]; then
        git clone https://github.com/lanmaster53/recon-ng 2>&1 | tee -a "$LOG_FILE"
    fi
    cd recon-ng
    pip_install "flask"
    pip_install "requests"
    pip_install "pyyaml"
    log_message "${GREEN}[✓] Recon-ng installed${NC}"
}

# [10] theHarvester
option_10() {
    log_message "${MAGENTA}[10] Installing theHarvester...${NC}"
    cd "$INSTALL_DIR"
    if [ ! -d "theHarvester" ]; then
        git clone https://github.com/laramies/theHarvester 2>&1 | tee -a "$LOG_FILE"
    fi
    cd theHarvester
    pip_install "requests"
    pip_install "beautifulsoup4"
    pip_install "dnspython"
    log_message "${GREEN}[✓] theHarvester installed${NC}"
}

# [11] SocialFish
option_11() {
    log_message "${MAGENTA}[11] Installing SocialFish...${NC}"
    cd "$INSTALL_DIR"
    if [ ! -d "SocialFish" ]; then
        git clone https://github.com/UndeadSec/SocialFish 2>&1 | tee -a "$LOG_FILE"
    fi
    cd SocialFish
    pip_install "requests"
    pip_install "flask"
    log_message "${GREEN}[✓] SocialFish installed${NC}"
}

# [12] HiddenEye
option_12() {
    log_message "${MAGENTA}[12] Installing HiddenEye...${NC}"
    cd "$INSTALL_DIR"
    if [ ! -d "HiddenEye" ]; then
        git clone https://github.com/DarkSecDevelopers/HiddenEye 2>&1 | tee -a "$LOG_FILE"
    fi
    cd HiddenEye
    pip_install "requests"
    pip_install "beautifulsoup4"
    log_message "${GREEN}[✓] HiddenEye installed${NC}"
}

# [13] Ngrok
option_13() {
    log_message "${MAGENTA}[13] Installing Ngrok...${NC}"
    apt_install "ngrok"
}

# [14] Cloudflared
option_14() {
    log_message "${MAGENTA}[14] Installing Cloudflared...${NC}"
    apt_install "cloudflared"
}

# [15] IP-Tracer
option_15() {
    log_message "${MAGENTA}[15] Installing IP-Tracer...${NC}"
    cd "$INSTALL_DIR"
    if [ ! -d "IP-Tracer" ]; then
        git clone https://github.com/rajkumardusad/IP-Tracer 2>&1 | tee -a "$LOG_FILE"
    fi
    cd IP-Tracer
    pip_install "requests"
    pip_install "beautifulsoup4"
    log_message "${GREEN}[✓] IP-Tracer installed${NC}"
}

# [16] Whois
option_16() {
    log_message "${MAGENTA}[16] Installing Whois...${NC}"
    apt_install "whois"
}

# [17] OpenSSL
option_17() {
    log_message "${MAGENTA}[17] Installing OpenSSL...${NC}"
    apt_install "openssl"
}

# [18] Curl
option_18() {
    log_message "${MAGENTA}[18] Installing Curl...${NC}"
    apt_install "curl"
}

# [19] Wget
option_19() {
    log_message "${MAGENTA}[19] Installing Wget...${NC}"
    apt_install "wget"
}

# [20] Install ALL tools
option_20() {
    log_message "${MAGENTA}[20] Installing ALL Tools (This will take time)...${NC}"
    
    for i in {1..19}; do
        log_message "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        "option_$i"
        log_message "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        sleep 2
    done
    
    log_message "${GREEN}[✓] ALL TOOLS INSTALLED!${NC}"
}

# ============================================================================
# MENU SYSTEM
# ============================================================================

show_menu() {
    show_logo
    
    echo -e "${YELLOW}[•] Available Tools:${NC}\n"
    
    echo -e "  ${CYAN}[1]${NC}  Update & Upgrade System"
    echo -e "  ${CYAN}[2]${NC}  Python3 & Pip"
    echo -e "  ${CYAN}[3]${NC}  Nmap (Network Mapper)"
    echo -e "  ${CYAN}[4]${NC}  Git"
    echo -e "  ${CYAN}[5]${NC}  Termux API"
    echo -e "  ${CYAN}[6]${NC}  Metasploit Framework"
    echo -e "  ${CYAN}[7]${NC}  Hydra (Password Cracker)"
    echo -e "  ${CYAN}[8]${NC}  SQLMap (SQLi Tester)"
    echo -e "  ${CYAN}[9]${NC}  Recon-ng (OSINT Framework)"
    echo -e "  ${CYAN}[10]${NC} theHarvester (Email Finder)"
    echo -e "  ${CYAN}[11]${NC} SocialFish (Phishing)"
    echo -e "  ${CYAN}[12]${NC} HiddenEye (Phishing)"
    echo -e "  ${CYAN}[13]${NC} Ngrok (Tunneling)"
    echo -e "  ${CYAN}[14]${NC} Cloudflared (Tunneling)"
    echo -e "  ${CYAN}[15]${NC} IP-Tracer (IP Tracking)"
    echo -e "  ${CYAN}[16]${NC} Whois (Domain Info)"
    echo -e "  ${CYAN}[17]${NC} OpenSSL (Encryption)"
    echo -e "  ${CYAN}[18]${NC} Curl (HTTP Client)"
    echo -e "  ${CYAN}[19]${NC} Wget (Download Tool)"
    echo -e "  ${CYAN}[20]${NC} ${RED}Install ALL Tools${NC}"
    echo -e "  ${CYAN}[0]${NC}  ${RED}Exit${NC}\n"
    
    echo -e "${WHITE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    read -p "$(echo -e ${YELLOW}Selection:${NC} )" choice
    
    if [ "$choice" == "0" ]; then
        log_message "${GREEN}[✓] Goodbye! Stay ethical! 🔥${NC}"
        exit 0
    fi
    
    # Validate input
    if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 0 ] || [ "$choice" -gt 20 ]; then
        log_message "${RED}[✗] Invalid selection${NC}"
        read -p "Press enter to continue..."
        show_menu
        return
    fi
    
    # Execute option if function exists
    if declare -f "option_$choice" > /dev/null; then
        "option_$choice"
        log_message "${GREEN}[✓] Option $choice completed${NC}"
    else
        log_message "${RED}[✗] Option $choice not found${NC}"
    fi
    
    read -p "$(echo -e ${YELLOW}Press enter to continue...${NC})"
    show_menu
}

# ============================================================================
# MAIN EXECUTION
# ============================================================================

# Check if running in Termux
if [ ! -d "/data/data/com.termux" ] && [ -z "$TERMUX_APP_PID" ]; then
    log_message "${YELLOW}[!] Warning: Not running in Termux${NC}"
    log_message "${YELLOW}[!] Some features may not work${NC}"
fi

# Check Python
if ! command -v python3 &> /dev/null; then
    log_message "${YELLOW}[*] Python3 not found, installing...${NC}"
    apt update && apt install -y python3
fi

# Start menu
show_menu
