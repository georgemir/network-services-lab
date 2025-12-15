# 🔧 DHCP Configuration Guide

## Overview

DHCP (Dynamic Host Configuration Protocol) automatically assigns IP addresses and other network configuration to devices on a network.

---

## DHCP Server Installation

### Ubuntu/Debian

```bash
# Update package list
sudo apt update

# Install ISC DHCP Server
sudo apt install isc-dhcp-server -y

# Check installation
dhcpd --version
```

### Configuration File

The main configuration file is `/etc/dhcp/dhcpd.conf`

```bash
# Edit configuration
sudo nano /etc/dhcp/dhcpd.conf
```

---

## Basic DHCP Configuration

### Simple DHCP Server

```dhcp
# /etc/dhcp/dhcpd.conf

# Global options
option domain-name "example.com";
option domain-name-servers 8.8.8.8, 8.8.4.4;
default-lease-time 600;
max-lease-time 7200;

# Subnet declaration
subnet 192.168.1.0 netmask 255.255.255.0 {
  option routers 192.168.1.1;
  option subnet-mask 255.255.255.0;
  option broadcast-address 192.168.1.255;
  
  # IP pool for DHCP clients
  range 192.168.1.100 192.168.1.200;
}
```

### Advanced Configuration

```dhcp
# Multiple subnets
subnet 192.168.1.0 netmask 255.255.255.0 {
  option routers 192.168.1.1;
  option subnet-mask 255.255.255.0;
  option broadcast-address 192.168.1.255;
  option domain-name-servers 8.8.8.8;
  
  range 192.168.1.100 192.168.1.200;
  
  # Lease times
  default-lease-time 600;
  max-lease-time 7200;
}

subnet 192.168.2.0 netmask 255.255.255.0 {
  option routers 192.168.2.1;
  option subnet-mask 255.255.255.0;
  option broadcast-address 192.168.2.255;
  
  range 192.168.2.100 192.168.2.200;
}

# Static IP assignment
host workstation {
  hardware ethernet 00:11:22:33:44:55;
  fixed-address 192.168.1.50;
}
```

---

## DHCP Server Management

### Start/Stop Service

```bash
# Start DHCP server
sudo systemctl start isc-dhcp-server

# Stop DHCP server
sudo systemctl stop isc-dhcp-server

# Restart DHCP server
sudo systemctl restart isc-dhcp-server

# Check status
sudo systemctl status isc-dhcp-server

# Enable on boot
sudo systemctl enable isc-dhcp-server
```

### Configuration Validation

```bash
# Test configuration syntax
sudo dhcpd -t -cf /etc/dhcp/dhcpd.conf

# Check for errors
sudo systemctl status isc-dhcp-server
```

---

## DHCP Lease Management

### View Active Leases

```bash
# View lease file
cat /var/lib/dhcp/dhcpd.leases

# Monitor leases in real-time
sudo tail -f /var/lib/dhcp/dhcpd.leases
```

### Lease File Format

```
lease 192.168.1.100 {
  starts 5 2025/01/10 14:30:45;
  ends 5 2025/01/10 14:40:45;
  tstp 5 2025/01/10 14:40:45;
  tsfp 5 2025/01/10 14:40:45;
  hardware ethernet 00:11:22:33:44:55;
  uid "\001\000\021\"\003DU";
  set vendor-string "MSFT 5.0";
  client-hostname "workstation";
}
```

---

## DHCP Client Configuration

### Linux Client

```bash
# Request DHCP lease
sudo dhclient eth0

# Release DHCP lease
sudo dhclient -r eth0

# Renew DHCP lease
sudo dhclient -n eth0

# View DHCP configuration
cat /etc/dhcp/dhclient.conf
```

### Client Configuration File

```bash
# /etc/dhcp/dhclient.conf

# Request specific options
request subnet-mask, broadcast-address, time-offset, routers,
        domain-name, domain-name-servers, host-name;

# Set hostname
send host-name "mycomputer";

# Timeout settings
timeout 60;
retry 60;
```

---

## DHCP Relay Agent

### Installation

```bash
# Install DHCP relay
sudo apt install isc-dhcp-relay -y
```

### Configuration

```bash
# Edit relay configuration
sudo nano /etc/default/isc-dhcp-relay

# Example configuration:
# SERVERS="192.168.1.1"
# INTERFACES="eth0 eth1"
# OPTIONS="-a -D"
```

### Start Relay

```bash
sudo systemctl start isc-dhcp-relay
sudo systemctl enable isc-dhcp-relay
```

---

## Troubleshooting

### Common Issues

**Issue: DHCP server not starting**
```bash
# Check configuration
sudo dhcpd -t -cf /etc/dhcp/dhcpd.conf

# Check logs
sudo journalctl -u isc-dhcp-server -n 50

# Check permissions
sudo ls -la /var/lib/dhcp/
```

**Issue: Clients not getting IP addresses**
```bash
# Check if server is running
sudo systemctl status isc-dhcp-server

# Check interface binding
sudo netstat -tlnp | grep dhcpd

# Check firewall
sudo ufw status
```

**Issue: Lease conflicts**
```bash
# Backup and clear leases
sudo cp /var/lib/dhcp/dhcpd.leases /var/lib/dhcp/dhcpd.leases.bak
sudo echo "" > /var/lib/dhcp/dhcpd.leases

# Restart server
sudo systemctl restart isc-dhcp-server
```

---

## Monitoring DHCP

### View DHCP Requests

```bash
# Monitor DHCP traffic
sudo tcpdump -i eth0 -n port 67 or port 68

# Monitor with verbose output
sudo tcpdump -i eth0 -vv port 67 or port 68
```

### DHCP Statistics

```bash
# View active leases count
grep "^lease" /var/lib/dhcp/dhcpd.leases | wc -l

# View lease distribution
grep "hardware ethernet" /var/lib/dhcp/dhcpd.leases | wc -l
```

---

## Security Best Practices

✅ **DO:**
- Restrict DHCP server access
- Use strong authentication
- Monitor DHCP activity
- Implement DHCP snooping
- Keep server updated

❌ **DON'T:**
- Allow unauthorized DHCP servers
- Use default configurations
- Ignore DHCP logs
- Assign overlapping ranges
- Disable security features

---

## Performance Tuning

### Optimize Lease Times

```dhcp
# For stable networks
default-lease-time 3600;    # 1 hour
max-lease-time 86400;       # 24 hours

# For mobile networks
default-lease-time 600;     # 10 minutes
max-lease-time 1800;        # 30 minutes
```

### Optimize Pool Size

```dhcp
# Calculate pool size
# Total devices - Reserved IPs = Pool size
# Example: 254 total - 50 reserved = 204 pool

range 192.168.1.50 192.168.1.254;
```

---

## Next Steps

- [ ] Install DHCP server
- [ ] Configure basic DHCP
- [ ] Test with DHCP clients
- [ ] Monitor DHCP activity
- [ ] Implement security
- [ ] Set up DHCP relay
- [ ] Configure advanced options

---

**Related Topics:**
- DNS Configuration
- Network Troubleshooting
- DHCP Relay
- DHCP Security
