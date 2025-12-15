# 🚀 Quick Start Guide

## Getting Started in 5 Minutes

### 1. Clone the Repository
```bash
git clone https://github.com/georgemir/network-services-lab.git
cd network-services-lab
```

### 2. Choose Your Learning Path

#### Path A: Network Services (DHCP, DNS, NAT)
```bash
# Read DHCP guide
cat 01-Network-Services/DHCP/dhcp-setup.md

# Read DNS guide
cat 01-Network-Services/DNS/dns-setup.md

# Read NAT guide
cat 01-Network-Services/NAT/nat-setup.md
```

#### Path B: Server Configuration (Apache2, FTP, SSH)
```bash
# Install Apache2
sudo bash Scripts/setup/apache2-install.sh

# Install FTP Server
sudo bash Scripts/setup/ftp-install.sh

# Configure SSH
cat 02-Server-Configuration/SSH/ssh-setup.md
```

#### Path C: Cisco Packet Tracer
```bash
# Read Packet Tracer basics
cat 03-Cisco-Packet-Tracer/Getting-Started/pkt-basics.md

# Follow lab scenarios
cat 03-Cisco-Packet-Tracer/Lab-Scenarios/scenario-1-basic.md
```

### 3. Run Your First Lab

#### Lab 1: Basic Network Setup
```bash
# Read the lab
cat Labs/lab-1-basic-network.md

# Follow the instructions
# Test connectivity
ping 192.168.1.1
```

#### Lab 2: DHCP Configuration
```bash
# Read the lab
cat Labs/lab-2-dhcp-setup.md

# Run setup script
sudo bash Scripts/setup/dhcp-setup.sh
```

#### Lab 3: Web Server Setup
```bash
# Read the lab
cat Labs/lab-5-web-server.md

# Run installation script
sudo bash Scripts/setup/apache2-install.sh

# Test the server
curl http://localhost
```

### 4. Monitor and Troubleshoot

```bash
# Check service status
sudo systemctl status apache2
sudo systemctl status vsftpd
sudo systemctl status ssh

# View logs
sudo tail -f /var/log/apache2/access.log
sudo tail -f /var/log/vsftpd.log

# Network diagnostics
sudo bash Scripts/troubleshooting/network-diagnostic.sh
```

---

## 📚 Learning Resources

### Documentation
- **Network Services:** `01-Network-Services/`
- **Server Configuration:** `02-Server-Configuration/`
- **Cisco Packet Tracer:** `03-Cisco-Packet-Tracer/`
- **TP-Link Router:** `04-TP-Link-Router/`

### Scripts
- **Setup Scripts:** `Scripts/setup/`
- **Configuration Scripts:** `Scripts/configuration/`
- **Monitoring Scripts:** `Scripts/monitoring/`
- **Troubleshooting Scripts:** `Scripts/troubleshooting/`

### Labs
- **10 Hands-on Labs:** `Labs/`
- **Lab Scenarios:** `03-Cisco-Packet-Tracer/Lab-Scenarios/`

### Cheat Sheets
- **Network Commands:** `Cheat-Sheets/network-commands.md`
- **Cisco Commands:** `Cheat-Sheets/cisco-commands.md`
- **Linux Commands:** `Cheat-Sheets/linux-server-commands.md`

---

## 🛠️ Common Tasks

### Install Apache2 Web Server
```bash
sudo bash Scripts/setup/apache2-install.sh
```

### Install FTP Server
```bash
sudo bash Scripts/setup/ftp-install.sh
```

### Configure DHCP Server
```bash
sudo bash Scripts/setup/dhcp-setup.sh
```

### Configure DNS Server
```bash
sudo bash Scripts/setup/dns-setup.sh
```

### Run Network Diagnostics
```bash
sudo bash Scripts/troubleshooting/network-diagnostic.sh
```

### Monitor System Health
```bash
bash Scripts/monitoring/service-monitor.sh
```

---

## 🔍 Troubleshooting

### Service Not Starting?
```bash
# Check service status
sudo systemctl status apache2

# View error logs
sudo journalctl -u apache2 -n 50

# Check configuration
sudo apache2ctl configtest
```

### Network Connectivity Issues?
```bash
# Run diagnostics
sudo bash Scripts/troubleshooting/network-diagnostic.sh

# Check interfaces
ip link show

# Check routes
ip route show

# Test connectivity
ping 8.8.8.8
```

### FTP Connection Issues?
```bash
# Check vsftpd status
sudo systemctl status vsftpd

# View FTP logs
sudo tail -f /var/log/vsftpd.log

# Test FTP connection
ftp localhost
```

---

## 📖 Next Steps

1. **Complete Lab 1** - Basic Network Setup
2. **Complete Lab 2** - DHCP Configuration
3. **Complete Lab 3** - DNS Configuration
4. **Complete Lab 4** - NAT Configuration
5. **Complete Lab 5** - Web Server Setup
6. **Complete Lab 6** - FTP Server Setup
7. **Complete Lab 7** - SSH Remote Access
8. **Complete Lab 8** - Log Analysis
9. **Complete Lab 9** - Troubleshooting
10. **Complete Lab 10** - Full Integration

---

## 💡 Tips

✅ **DO:**
- Read documentation before running scripts
- Test in safe environment first
- Keep backups of configurations
- Monitor logs regularly
- Document your changes

❌ **DON'T:**
- Run scripts without understanding them
- Use default passwords in production
- Ignore error messages
- Skip security configuration
- Forget to enable services on boot

---

## 🆘 Need Help?

- Check the relevant documentation file
- Review the troubleshooting guide
- Check logs for error messages
- Run diagnostic scripts
- Consult the cheat sheets

---

## 🎯 Learning Outcomes

After completing this quick start, you will be able to:
- ✅ Understand network services basics
- ✅ Install and configure web servers
- ✅ Set up FTP servers
- ✅ Configure SSH access
- ✅ Troubleshoot network issues
- ✅ Analyze system logs
- ✅ Design network topologies
- ✅ Implement security practices

---

**Ready to start? Pick a path above and begin learning!** 🚀
