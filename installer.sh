#!/bin/bash
#copyright ofganzx dont rename authors
# Fungsi untuk menginstal tool
install_tool() {
    echo "Installing $1..."
    $2
    echo "$1 installation completed!"
}

# Update dan upgrade sistem
echo "Updating system..."
pkg update -y && pkg upgrade -y

# Instalasi dependencies dasar
echo "Installing basic dependencies..."
pkg install -y git curl wget python python-pip ruby jq tmux build-essential unzip dnsutils

# Install Go (dibutuhkan oleh banyak tools)
echo "Installing Go..."
wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
tar -xvf go1.21.1.linux-amd64.tar.gz -C $PREFIX
echo 'export PATH=$PATH:$PREFIX/go/bin' >> ~/.bashrc
source ~/.bashrc

# Install tools
mkdir -p ~/bugbounty-tools
cd ~/bugbounty-tools

### 1. **Reconnaissance Tools**
install_tool "Subfinder" "go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
install_tool "Amass" "pkg install -y amass"
install_tool "Assetfinder" "go install -v github.com/tomnomnom/assetfinder@latest"
install_tool "Findomain" "wget https://github.com/Findomain/Findomain/releases/latest/download/findomain-linux -O findomain && chmod +x findomain && mv findomain $PREFIX/bin"
install_tool "Shodan" "pip install shodan"
install_tool "dnsx" "go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
install_tool "Hakrawler" "go install github.com/hakluke/hakrawler@latest"
install_tool "gau" "go install -v github.com/lc/gau/v2/cmd/gau@latest"
install_tool "waybackurls" "go install -v github.com/tomnomnom/waybackurls@latest"
install_tool "Aquatone" "go install github.com/michenriksen/aquatone@latest"
install_tool "Crobat" "go install github.com/cgboal/sonarsearch/crobat@latest"
install_tool "GitHub-Subdomains" "git clone https://github.com/gwen001/github-subdomains.git && cd github-subdomains && pip install -r requirements.txt"
install_tool "LinkFinder" "git clone https://github.com/GerbenJavado/LinkFinder.git && cd LinkFinder && pip install -r requirements.txt"

### 2. **Scanning Tools**
install_tool "Nmap" "pkg install -y nmap"
install_tool "Masscan" "pkg install -y masscan"
install_tool "ffuf" "go install -v github.com/ffuf/ffuf@latest"
install_tool "Dirsearch" "git clone https://github.com/maurosoria/dirsearch.git ~/bugbounty-tools/dirsearch && cd ~/bugbounty-tools/dirsearch && pip install -r requirements.txt"
install_tool "nuclei" "go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest"
install_tool "Traceroute" "pkg install -y traceroute"
install_tool "XSStrike" "git clone https://github.com/s0md3v/XSStrike.git && cd XSStrike && pip install -r requirements.txt"
install_tool "ParamSpider" "git clone https://github.com/devanshbatham/ParamSpider.git && cd ParamSpider && pip install -r requirements.txt"
install_tool "CORS Scanner" "git clone https://github.com/chenjj/CORScanner.git && cd CORScanner && pip install -r requirements.txt"
install_tool "Dnsgen" "pip install dnsgen"

### 3. **Exploitation Tools**
install_tool "SQLmap" "pkg install -y sqlmap"
install_tool "Metasploit" "pkg install -y unstable-repo && pkg install -y metasploit"
install_tool "XSpear" "gem install XSpear"
install_tool "Commix" "git clone https://github.com/commixproject/commix.git && cd commix && pip install -r requirements.txt"
install_tool "SQLiv" "git clone https://github.com/Hades132/sqliv.git && cd sqliv && pip install -r requirements.txt"
install_tool "JexBoss" "git clone https://github.com/joaomatosf/jexboss.git && cd jexboss"
install_tool "Arjun" "git clone https://github.com/s0md3v/Arjun.git && cd Arjun && pip install -r requirements.txt"
install_tool "Up Shell" "git clone https://github.com/tennc/webshell.git ~/bugbounty-tools/up-shell"

### 4. **Information Gathering Tools**
install_tool "theHarvester" "git clone https://github.com/laramies/theHarvester.git && cd theHarvester && pip install -r requirements.txt"
install_tool "Recon-ng" "git clone https://github.com/lanmaster53/recon-ng.git && cd recon-ng && pip install -r REQUIREMENTS"
install_tool "WhatWeb" "pkg install -y whatweb"
install_tool "DnsDumpster" "pip install dnsdumpster"

### 5. **Wordlist Tools**
install_tool "SecLists" "git clone https://github.com/danielmiessler/SecLists.git ~/bugbounty-tools/SecLists"
install_tool "Knockpy" "git clone https://github.com/guelfoweb/knock.git && cd knock && pip install -r requirements.txt"

### 6. **Web Application Vulnerability Tools**
install_tool "wpscan" "gem install wpscan"
install_tool "Nikto" "pkg install -y nikto"
install_tool "Burp Bounty" "git clone https://github.com/wagiro/BurpBounty.git && cd BurpBounty"

### 7. **Password Cracking Tools**
install_tool "Hydra" "pkg install -y hydra"
install_tool "John the Ripper" "pkg install -y john"
install_tool "hashcat" "pkg install -y hashcat"

### Cleanup
echo "Cleaning up..."
rm -f go1.21.1.linux-amd64.tar.gz

### Menambahkan tools ke PATH
echo "Adding tools to PATH..."
echo 'export PATH=$PATH:$PREFIX/go/bin:$HOME/bugbounty-tools' >> ~/.bashrc
source ~/.bashrc

echo "Installation complete! All tools are installed in ~/bugbounty-tools."