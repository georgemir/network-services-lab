# 🌐 Network Services & Server Configuration Lab

**Hands-on learning guide for network services, server configuration, and Linux system administration.**

> *Master DHCP, DNS, NAT, SSH, Apache2, FTP, and network troubleshooting through practical labs and real-world scenarios.*

---

## 📚 Overview

This repository documents a comprehensive learning journey in network services and server configuration. It combines theoretical knowledge with practical hands-on experience using industry-standard tools and technologies.

**Perfect for:**
- 🎓 Learning network services configuration
- 🛠️ IT professionals building server skills
- 🔐 Cybersecurity enthusiasts
- 📈 Career development in infrastructure
- 🌐 Network administration basics

---

## 🎯 Skills Covered

### ✅ Network Services
- **DHCP** - Dynamic Host Configuration Protocol setup and troubleshooting
- **DNS** - Domain Name System configuration (8.8.8.8 and custom DNS)
- **NAT** - Network Address Translation configuration
- **DHCP Relay** - Advanced DHCP configuration
- **DNS Forwarding** - DNS query routing

### ✅ Server Configuration
- **Apache2** - Web server installation and configuration
- **FTP Server** - File Transfer Protocol setup
- **SSH** - Secure Shell remote access
- **WinSCP** - Secure file transfer
- **Log Management** - Linux log analysis and monitoring

### ✅ Network Simulation
- **Cisco Packet Tracer** - Network topology design and simulation
- **Router Configuration** - Cisco IOS commands
- **Switch Configuration** - VLAN and port configuration
- **Wireless Configuration** - TP-Link router setup

### ✅ Practical Skills
- **Network Troubleshooting** - Ping, traceroute, netstat
- **Server Monitoring** - System and service monitoring
- **Security Hardening** - Basic security practices
- **Log Analysis** - Understanding and parsing logs

---

## 📁 Repository Structure

```
network-services-lab/
│
├── 📖 README.md                          # This file
├── 📋 QUICK_START.md                     # Quick start guide
├── 📝 SKILLS_CHECKLIST.md                # Skills verification
│
├── 🌐 01-Network-Services/
│   ├── DHCP/
│   │   ├── dhcp-setup.md                 # DHCP configuration guide
│   │   ├── dhcp-troubleshooting.md       # Common issues & solutions
│   │   ├── dhcp-config-example.txt       # Configuration examples
│   │   └── dhcp-commands.sh              # DHCP management commands
│   │
│   ├── DNS/
│   │   ├── dns-setup.md                  # DNS configuration guide
│   │   ├── dns-troubleshooting.md        # DNS troubleshooting
│   │   ├── dns-config-example.txt        # Configuration examples
│   │   └── dns-commands.sh               # DNS management commands
│   │
│   ├── NAT/
│   │   ├── nat-setup.md                  # NAT configuration guide
│   │   ├── nat-examples.txt              # NAT configuration examples
│   │   └── nat-commands.sh               # NAT management commands
│   │
│   └── Network-Troubleshooting/
│       ├── troubleshooting-guide.md      # Troubleshooting methodology
│       ├── common-issues.md              # Common network issues
│       └── diagnostic-commands.sh        # Diagnostic commands
│
├── 🖥️ 02-Server-Configuration/
│   ├── Apache2/
│   │   ├── apache2-setup.md              # Apache2 installation guide
│   │   ├── apache2-install.sh            # Installation script
│   │   ├── apache2-config.conf           # Configuration examples
│   │   ├── virtual-hosts.md              # Virtual hosts setup
│   │   └── apache2-troubleshooting.md    # Troubleshooting guide
│   │
│   ├── FTP-Server/
│   │   ├── ftp-setup.md                  # FTP server setup
│   │   ├── ftp-install.sh                # Installation script
│   │   ├── ftp-config.conf               # Configuration examples
│   │   ├── vsftpd-setup.md               # vsftpd configuration
│   │   └── ftp-security.md               # FTP security practices
│   │
│   ├── SSH/
│   │   ├── ssh-setup.md                  # SSH configuration guide
│   │   ├── ssh-config.txt                # SSH configuration examples
│   │   ├── ssh-keys.md                   # SSH key generation
│   │   ├── ssh-hardening.sh              # SSH hardening script
│   │   └── winscp-guide.md               # WinSCP setup guide
│   │
│   └── Log-Management/
│       ├── log-structure.md              # Linux log file structure
│       ├── log-analysis.md               # Log analysis techniques
│       ├── log-parser.sh                 # Log parsing script
│       ├── log-monitoring.sh             # Log monitoring script
│       └── log-rotation.md               # Log rotation setup
│
├── 🎮 03-Cisco-Packet-Tracer/
│   ├── Getting-Started/
│   │   ├── pkt-basics.md                 # Packet Tracer basics
│   │   ├── interface-overview.md         # Interface guide
│   │   └── first-network.md              # Creating first network
│   │
│   ├── Network-Topologies/
│   │   ├── simple-network.md             # Simple network topology
│   │   ├── dhcp-network.md               # DHCP network setup
│   │   ├── dns-network.md                # DNS network setup
│   │   ├── nat-network.md                # NAT network setup
│   │   └── complex-network.md            # Complex topology
│   │
│   ├── Router-Configuration/
│   │   ├── router-basics.md              # Router configuration basics
│   │   ├── router-commands.txt           # Essential router commands
│   │   ├── static-routing.md             # Static routing setup
│   │   ├── dynamic-routing.md            # Dynamic routing (RIP, OSPF)
│   │   └── router-security.md            # Router security
│   │
│   ├── Switch-Configuration/
│   │   ├── switch-basics.md              # Switch configuration basics
│   │   ├── vlan-setup.md                 # VLAN configuration
│   │   ├── switch-commands.txt           # Essential switch commands
│   │   └── port-security.md              # Port security setup
│   │
│   └── Lab-Scenarios/
│       ├── scenario-1-basic.md           # Scenario 1: Basic network
│       ├── scenario-2-dhcp-dns.md        # Scenario 2: DHCP & DNS
│       ├── scenario-3-nat.md             # Scenario 3: NAT setup
│       ├── scenario-4-security.md        # Scenario 4: Security
│       └── scenario-5-complex.md         # Scenario 5: Complex network
│
├── 🔗 04-TP-Link-Router/
│   ├── Getting-Started/
│   │   ├── router-overview.md            # TP-Link router overview
│   │   ├── initial-setup.md              # Initial setup guide
│   │   └── web-interface.md              # Web interface guide
│   │
│   ├── Configuration/
│   │   ├── network-settings.md           # Network configuration
│   │   ├── wireless-setup.md             # Wireless configuration
│   │   ├── dhcp-setup.md                 # DHCP server setup
│   │   ├── port-forwarding.md            # Port forwarding
│   │   ├── firewall-setup.md             # Firewall configuration
│   │   └── advanced-settings.md          # Advanced settings
│   │
│   ├── Security/
│   │   ├── password-security.md          # Password management
│   │   ├── wireless-security.md          # WiFi security (WPA2/WPA3)
│   │   ├── firewall-rules.md             # Firewall rules
│   │   └── access-control.md             # Access control lists
│   │
│   └── Troubleshooting/
│       ├── connection-issues.md          # Connection troubleshooting
│       ├── wifi-issues.md                # WiFi troubleshooting
│       ├── performance-issues.md         # Performance optimization
│       └── factory-reset.md              # Factory reset guide
│
├── 🛠️ Scripts/
│   ├── setup/
│   │   ├── apache2-install.sh            # Apache2 installation
│   │   ├── ftp-install.sh                # FTP server installation
│   │   ├── ssh-setup.sh                  # SSH configuration
│   │   └── full-setup.sh                 # Complete setup script
│   │
│   ├── configuration/
│   │   ├── dhcp-config.sh                # DHCP configuration
│   │   ├── dns-config.sh                 # DNS configuration
│   │   ├── nat-config.sh                 # NAT configuration
│   │   └── firewall-config.sh            # Firewall configuration
│   │
│   ├── monitoring/
│   │   ├── service-monitor.sh            # Service monitoring
│   │   ├── network-monitor.sh            # Network monitoring
│   │   ├── log-monitor.sh                # Log monitoring
│   │   └── performance-monitor.sh        # Performance monitoring
│   │
│   ├── troubleshooting/
│   │   ├── network-diagnostic.sh         # Network diagnostics
│   │   ├── service-diagnostic.sh         # Service diagnostics
│   │   ├── log-analyzer.sh               # Log analysis
│   │   └── connectivity-test.sh          # Connectivity testing
│   │
│   └── maintenance/
│       ├── backup-config.sh              # Configuration backup
│       ├── log-rotation.sh               # Log rotation
│       ├── cleanup.sh                    # System cleanup
│       └── health-check.sh               # System health check
│
├── 📚 Cheat-Sheets/
│   ├── network-commands.md               # Network commands reference
│   ├── cisco-commands.md                 # Cisco IOS commands
│   ├── linux-server-commands.md          # Linux server commands
│   ├── troubleshooting-checklist.md      # Troubleshooting checklist
│   └── quick-reference.md                # Quick reference guide
│
├── 📋 Labs/
│   ├── lab-1-basic-network.md            # Lab 1: Basic network
│   ├── lab-2-dhcp-setup.md               # Lab 2: DHCP configuration
│   ├── lab-3-dns-setup.md                # Lab 3: DNS configuration
│   ├── lab-4-nat-setup.md                # Lab 4: NAT configuration
│   ├── lab-5-web-server.md               # Lab 5: Web server setup
│   ├── lab-6-ftp-server.md               # Lab 6: FTP server setup
│   ├── lab-7-ssh-access.md               # Lab 7: SSH remote access
│   ├── lab-8-log-analysis.md             # Lab 8: Log analysis
│   ├── lab-9-troubleshooting.md          # Lab 9: Troubleshooting
│   └── lab-10-integration.md             # Lab 10: Full integration
│
├── 🔗 Resources/
│   ├── useful-links.md                   # External resources
│   ├── documentation-links.md            # Official documentation
│   ├── tools-and-software.md             # Required tools
│   └── certifications.md                 # Relevant certifications
│
└── 📄 LICENSE                            # MIT License
```

---

## 🚀 Quick Start

### Prerequisites
- Linux system (Ubuntu, Debian, or similar)
- Cisco Packet Tracer (free download)
- TP-Link router (or similar)
- SSH client (built-in on Linux/Mac, PuTTY/WinSCP on Windows)
- Basic networking knowledge

### Getting Started

1. **Clone the repository:**
```bash
git clone https://github.com/georgemir/network-services-lab.git
cd network-services-lab
```

2. **Read the quick start guide:**
```bash
cat QUICK_START.md
```

3. **Choose your learning path:**
   - Start with Network Services (DHCP, DNS, NAT)
   - Or start with Server Configuration (Apache2, FTP, SSH)
   - Or start with Cisco Packet Tracer labs

4. **Follow the labs:**
```bash
# Read lab documentation
cat Labs/lab-1-basic-network.md

# Run setup scripts if needed
chmod +x Scripts/setup/*.sh
./Scripts/setup/apache2-install.sh
```

---

## 📊 Learning Path

### Phase 1: Network Services (Week 1-2)
- [ ] DHCP configuration and troubleshooting
- [ ] DNS setup and management
- [ ] NAT configuration
- [ ] Network troubleshooting basics

### Phase 2: Server Configuration (Week 3-4)
- [ ] Apache2 web server setup
- [ ] FTP server installation
- [ ] SSH remote access
- [ ] Log management

### Phase 3: Cisco Packet Tracer (Week 5-6)
- [ ] Basic network topology
- [ ] Router and switch configuration
- [ ] Network simulation
- [ ] Complex scenarios

### Phase 4: Integration & Advanced (Week 7-8)
- [ ] TP-Link router configuration
- [ ] Full network integration
- [ ] Security hardening
- [ ] Advanced troubleshooting

---

## 🎓 Learning Outcomes

After completing this lab, you will be able to:

✅ Configure and troubleshoot DHCP servers
✅ Set up and manage DNS services
✅ Implement NAT for network address translation
✅ Install and configure Apache2 web server
✅ Set up FTP server with proper security
✅ Configure SSH for secure remote access
✅ Analyze and manage Linux logs
✅ Design network topologies in Cisco Packet Tracer
✅ Configure Cisco routers and switches
✅ Troubleshoot network connectivity issues
✅ Set up and secure TP-Link routers
✅ Implement network security best practices

---

## 🛠️ Tools & Technologies

| Tool | Purpose | Version |
|------|---------|---------|
| Cisco Packet Tracer | Network simulation | Latest |
| Apache2 | Web server | 2.4+ |
| vsftpd | FTP server | 3.0+ |
| OpenSSH | SSH server | 7.4+ |
| Linux | Operating system | Ubuntu 20.04+ |
| TP-Link Router | Wireless router | AC1200+ |

---

## 📝 Labs Overview

### Lab 1: Basic Network
- Create simple network topology
- Configure IP addresses
- Test connectivity

### Lab 2: DHCP Setup
- Configure DHCP server
- Set up DHCP relay
- Test DHCP clients

### Lab 3: DNS Setup
- Configure DNS server
- Set up DNS forwarding
- Test DNS resolution

### Lab 4: NAT Configuration
- Configure NAT on router
- Test internal/external connectivity
- Troubleshoot NAT issues

### Lab 5: Web Server
- Install Apache2
- Configure virtual hosts
- Set up SSL/TLS

### Lab 6: FTP Server
- Install vsftpd
- Configure FTP users
- Test FTP connectivity

### Lab 7: SSH Access
- Configure SSH server
- Generate SSH keys
- Set up WinSCP

### Lab 8: Log Analysis
- Understand log structure
- Parse and analyze logs
- Set up log monitoring

### Lab 9: Troubleshooting
- Diagnose network issues
- Troubleshoot services
- Resolve connectivity problems

### Lab 10: Integration
- Combine all services
- Create complete network
- Implement security

---

## 💡 Best Practices

### Network Configuration
- ✅ Document all configurations
- ✅ Use consistent IP addressing
- ✅ Implement proper security
- ✅ Test before deployment
- ✅ Keep backups

### Server Management
- ✅ Monitor service status
- ✅ Analyze logs regularly
- ✅ Update systems promptly
- ✅ Implement access controls
- ✅ Plan for scalability

### Security
- ✅ Use strong passwords
- ✅ Implement firewalls
- ✅ Enable encryption
- ✅ Restrict access
- ✅ Audit regularly

---

## 🔗 Connect & Contribute

- 💼 **LinkedIn:** [linkedin.com/in/george-miron](https://linkedin.com/in/george-miron)
- 📧 **Email:** mi.geo76@gmail.com
- 🐙 **GitHub:** [@georgemir](https://github.com/georgemir)

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Cisco Networking Academy
- Linux Foundation
- Open Source Community
- IT Operations Community

---

<div align="center">

### 🎯 Start Your Network Services Journey Today!

*"Master Networks. Master Servers. Master Infrastructure."*

**[Start Learning →](QUICK_START.md)**

</div>
