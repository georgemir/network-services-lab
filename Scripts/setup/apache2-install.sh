#!/bin/bash

################################################################################
# Apache2 Web Server Installation Script
# Purpose: Install and configure Apache2 with SSL support
# Author: George Miron
# Usage: sudo ./apache2-install.sh
################################################################################

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
DOMAIN="${1:-example.com}"
EMAIL="${2:-admin@example.com}"

################################################################################
# Functions
################################################################################

print_header() {
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  APACHE2 WEB SERVER INSTALLATION                          ║${NC}"
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

# Update system
update_system() {
    print_section "Updating System"
    apt update
    apt upgrade -y
    print_status "OK" "System updated"
}

# Install Apache2
install_apache2() {
    print_section "Installing Apache2"
    
    apt install -y apache2 apache2-utils
    print_status "OK" "Apache2 installed"
    
    # Enable required modules
    a2enmod rewrite
    a2enmod ssl
    a2enmod proxy
    a2enmod proxy_http
    a2enmod headers
    a2enmod deflate
    
    print_status "OK" "Apache2 modules enabled"
}

# Create document root
create_document_root() {
    print_section "Creating Document Root"
    
    mkdir -p /var/www/$DOMAIN/html
    mkdir -p /var/www/$DOMAIN/logs
    
    # Create sample index.html
    cat > /var/www/$DOMAIN/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Apache2</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 50px; }
        h1 { color: #333; }
        .info { background: #f0f0f0; padding: 20px; border-radius: 5px; }
    </style>
</head>
<body>
    <h1>✓ Apache2 is Running!</h1>
    <div class="info">
        <p>Your Apache2 web server is successfully installed and running.</p>
        <p>Server: Apache/2.4</p>
        <p>Document Root: /var/www/example.com/html</p>
    </div>
</body>
</html>
EOF
    
    # Set permissions
    chown -R www-data:www-data /var/www/$DOMAIN
    chmod -R 755 /var/www/$DOMAIN
    
    print_status "OK" "Document root created"
}

# Create virtual host
create_virtual_host() {
    print_section "Creating Virtual Host"
    
    cat > /etc/apache2/sites-available/$DOMAIN.conf << EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    ServerAlias www.$DOMAIN
    ServerAdmin $EMAIL
    
    DocumentRoot /var/www/$DOMAIN/html
    
    <Directory /var/www/$DOMAIN/html>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
    # Logging
    ErrorLog /var/www/$DOMAIN/logs/error.log
    CustomLog /var/www/$DOMAIN/logs/access.log combined
    
    # Performance
    <IfModule mod_deflate.c>
        AddOutputFilterByType DEFLATE text/html text/plain text/xml
        AddOutputFilterByType DEFLATE text/css text/javascript
        AddOutputFilterByType DEFLATE application/javascript application/json
    </IfModule>
    
    # Security headers
    <IfModule mod_headers.c>
        Header set X-Content-Type-Options "nosniff"
        Header set X-Frame-Options "SAMEORIGIN"
        Header set X-XSS-Protection "1; mode=block"
    </IfModule>
</VirtualHost>
EOF
    
    # Enable site
    a2ensite $DOMAIN.conf
    a2dissite 000-default.conf
    
    print_status "OK" "Virtual host created"
}

# Configure SSL (self-signed)
configure_ssl() {
    print_section "Configuring SSL"
    
    # Create self-signed certificate
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/$DOMAIN.key \
        -out /etc/ssl/certs/$DOMAIN.crt \
        -subj "/C=US/ST=State/L=City/O=Organization/CN=$DOMAIN"
    
    # Create SSL virtual host
    cat > /etc/apache2/sites-available/$DOMAIN-ssl.conf << EOF
<VirtualHost *:443>
    ServerName $DOMAIN
    ServerAlias www.$DOMAIN
    ServerAdmin $EMAIL
    
    DocumentRoot /var/www/$DOMAIN/html
    
    # SSL Configuration
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/$DOMAIN.crt
    SSLCertificateKeyFile /etc/ssl/private/$DOMAIN.key
    
    # SSL Security
    SSLProtocol TLSv1.2 TLSv1.3
    SSLCipherSuite HIGH:!aNULL:!MD5
    SSLHonorCipherOrder on
    
    <Directory /var/www/$DOMAIN/html>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
    # Logging
    ErrorLog /var/www/$DOMAIN/logs/error.log
    CustomLog /var/www/$DOMAIN/logs/access.log combined
</VirtualHost>
EOF
    
    # Enable SSL site
    a2ensite $DOMAIN-ssl.conf
    
    print_status "OK" "SSL configured"
}

# Test configuration
test_configuration() {
    print_section "Testing Configuration"
    
    if apache2ctl configtest; then
        print_status "OK" "Apache2 configuration is valid"
    else
        print_status "ERROR" "Apache2 configuration has errors"
        exit 1
    fi
}

# Start Apache2
start_apache2() {
    print_section "Starting Apache2"
    
    systemctl restart apache2
    systemctl enable apache2
    
    if systemctl is-active --quiet apache2; then
        print_status "OK" "Apache2 is running"
    else
        print_status "ERROR" "Apache2 failed to start"
        exit 1
    fi
}

# Display information
display_info() {
    print_section "Installation Complete"
    
    echo -e "\n${BLUE}Web Server Information:${NC}"
    echo "  Domain: $DOMAIN"
    echo "  Document Root: /var/www/$DOMAIN/html"
    echo "  HTTP: http://$DOMAIN"
    echo "  HTTPS: https://$DOMAIN"
    echo ""
    echo -e "${BLUE}Useful Commands:${NC}"
    echo "  Start Apache2: sudo systemctl start apache2"
    echo "  Stop Apache2: sudo systemctl stop apache2"
    echo "  Restart Apache2: sudo systemctl restart apache2"
    echo "  Check status: sudo systemctl status apache2"
    echo "  View logs: sudo tail -f /var/www/$DOMAIN/logs/access.log"
    echo ""
    echo -e "${BLUE}Next Steps:${NC}"
    echo "  1. Update DNS records to point to this server"
    echo "  2. Configure firewall (allow ports 80 and 443)"
    echo "  3. Set up SSL certificate (Let's Encrypt recommended)"
    echo "  4. Configure virtual hosts as needed"
    echo ""
}

################################################################################
# Main Execution
################################################################################

main() {
    print_header
    
    check_root
    update_system
    install_apache2
    create_document_root
    create_virtual_host
    configure_ssl
    test_configuration
    start_apache2
    display_info
    
    echo -e "${GREEN}✓ Apache2 installation completed successfully!${NC}\n"
}

main "$@"
