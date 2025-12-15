#!/bin/bash

################################################################################
# FTP Server Installation Script
# Purpose: Install and configure vsftpd (Very Secure FTP Daemon)
# Author: George Miron
# Usage: sudo ./ftp-install.sh
################################################################################

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

################################################################################
# Functions
################################################################################

print_header() {
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  FTP SERVER (vsftpd) INSTALLATION                         ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}\n"
}

print_section() {
    echo -e "\n${BLUE}▶ $1${NC}"
    echo -e "${BLUE}─────────────────────────────────────────────────────────${NC}"
}

print_status() {
    local status=$1
    local message=$2
    
    if [ "$status" = "OK" ]; then
        echo -e "${GREEN}[✓]${NC} $message"
    elif [ "$status" = "WARNING" ]; then
        echo -e "${YELLOW}[⚠]${NC} $message"
    else
        echo -e "${RED}[✗]${NC} $message"
    fi
}

# Check if running as root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        print_status "ERROR" "This script must be run as root"
        exit 1
    fi
}

# Install vsftpd
install_vsftpd() {
    print_section "Installing vsftpd"
    
    apt update
    apt install -y vsftpd
    
    print_status "OK" "vsftpd installed"
}

# Backup original configuration
backup_config() {
    print_section "Backing Up Configuration"
    
    cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
    print_status "OK" "Configuration backed up to /etc/vsftpd.conf.bak"
}

# Configure vsftpd
configure_vsftpd() {
    print_section "Configuring vsftpd"
    
    cat > /etc/vsftpd.conf << 'EOF'
# vsftpd Configuration File

# Basic Settings
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES

# Logging
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log
xferlog_std_format=YES
log_ftp_protocol=YES

# Security Settings
chroot_local_user=YES
allow_writeable_chroot=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO

# Performance
max_clients=0
max_per_ip=0
data_connection_timeout=120
idle_session_timeout=300

# User Configuration
user_config_dir=/etc/vsftpd/user_conf
userlist_enable=YES
userlist_file=/etc/vsftpd/user_list
userlist_deny=NO

# Passive Mode
pasv_enable=YES
pasv_min_port=10000
pasv_max_port=10100
pasv_address=127.0.0.1

# Banner
ftpd_banner=Welcome to FTP Server
EOF
    
    print_status "OK" "vsftpd configured"
}

# Create user configuration directory
create_user_config() {
    print_section "Creating User Configuration"
    
    mkdir -p /etc/vsftpd/user_conf
    touch /etc/vsftpd/user_list
    
    print_status "OK" "User configuration directory created"
}

# Create FTP user
create_ftp_user() {
    print_section "Creating FTP User"
    
    # Create FTP user
    if ! id "ftpuser" &>/dev/null; then
        useradd -m -s /usr/sbin/nologin ftpuser
        echo "ftpuser:ftppass" | chpasswd
        print_status "OK" "FTP user created (username: ftpuser, password: ftppass)"
    else
        print_status "WARNING" "FTP user already exists"
    fi
    
    # Add to user list
    echo "ftpuser" > /etc/vsftpd/user_list
    
    # Create FTP directory
    mkdir -p /home/ftpuser/ftp
    chown -R ftpuser:ftpuser /home/ftpuser/ftp
    chmod -R 755 /home/ftpuser/ftp
    
    print_status "OK" "FTP directory created"
}

# Create user-specific configuration
create_user_specific_config() {
    print_section "Creating User-Specific Configuration"
    
    cat > /etc/vsftpd/user_conf/ftpuser << 'EOF'
local_root=/home/ftpuser/ftp
write_enable=YES
anon_upload_enable=NO
anon_mkdir_write_enable=NO
anon_other_write_enable=NO
EOF
    
    print_status "OK" "User-specific configuration created"
}

# Configure firewall
configure_firewall() {
    print_section "Configuring Firewall"
    
    if command -v ufw &> /dev/null; then
        ufw allow 20/tcp
        ufw allow 21/tcp
        ufw allow 10000:10100/tcp
        print_status "OK" "Firewall rules added"
    else
        print_status "WARNING" "UFW not found, please configure firewall manually"
    fi
}

# Start vsftpd
start_vsftpd() {
    print_section "Starting vsftpd"
    
    systemctl restart vsftpd
    systemctl enable vsftpd
    
    if systemctl is-active --quiet vsftpd; then
        print_status "OK" "vsftpd is running"
    else
        print_status "ERROR" "vsftpd failed to start"
        exit 1
    fi
}

# Display information
display_info() {
    print_section "Installation Complete"
    
    echo -e "\n${BLUE}FTP Server Information:${NC}"
    echo "  Service: vsftpd"
    echo "  Port: 21 (FTP), 20 (Data)"
    echo "  Passive Mode: 10000-10100"
    echo "  Default User: ftpuser"
    echo "  Default Password: ftppass"
    echo "  FTP Root: /home/ftpuser/ftp"
    echo ""
    echo -e "${BLUE}Useful Commands:${NC}"
    echo "  Start vsftpd: sudo systemctl start vsftpd"
    echo "  Stop vsftpd: sudo systemctl stop vsftpd"
    echo "  Restart vsftpd: sudo systemctl restart vsftpd"
    echo "  Check status: sudo systemctl status vsftpd"
    echo "  View logs: sudo tail -f /var/log/vsftpd.log"
    echo ""
    echo -e "${BLUE}Create Additional FTP Users:${NC}"
    echo "  1. Create system user: sudo useradd -m -s /usr/sbin/nologin username"
    echo "  2. Set password: sudo passwd username"
    echo "  3. Add to user list: echo 'username' | sudo tee -a /etc/vsftpd/user_list"
    echo "  4. Create user config: sudo nano /etc/vsftpd/user_conf/username"
    echo "  5. Restart vsftpd: sudo systemctl restart vsftpd"
    echo ""
    echo -e "${YELLOW}⚠ IMPORTANT: Change default password!${NC}"
    echo "  sudo passwd ftpuser"
    echo ""
}

################################################################################
# Main Execution
################################################################################

main() {
    print_header
    
    check_root
    install_vsftpd
    backup_config
    configure_vsftpd
    create_user_config
    create_ftp_user
    create_user_specific_config
    configure_firewall
    start_vsftpd
    display_info
    
    echo -e "${GREEN}✓ FTP server installation completed successfully!${NC}\n"
}

main "$@"
