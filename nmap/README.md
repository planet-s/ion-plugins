# Nmap aliases plugin

Adds some useful aliases for nmap similar to the profiles in zenmap.

Nmap options are:
 * -sS - TCP SYN scan
 * -v - verbose
 * -T1 - timing of scan. Options are paranoid (0), sneaky (1), polite (2), normal (3), aggressive (4), and insane (5)
 * -sF - FIN scan (can sneak through non-stateful firewalls)
 * -PE - ICMP echo discovery probe
 * -PP - timestamp discovery probe
 * -PY - SCTP init ping
 * -g - use given number as source port
 * -A - enable OS detection, version detection, script scanning, and traceroute (aggressive)
 * -O - enable OS detection
 * -sA - TCP ACK scan
 * -F - fast scan
 * --script=vulscan - also access vulnerabilities in target

## Aliases explained

 * nmap\_open\_ports - Scan for open ports on target
 * nmap\_list\_interfaces - List all network interfaces on host where the command runs
 * nmap\_slow - Slow scan that avoids to spam the targets logs
 * nmap\_fin - Scan to see if hosts are up with TCP FIN scan
 * nmap\_full - Aggressive full scan that scans all ports, tries to determine OS and service versions
 * nmap\_check\_for\_firewall - TCP ACK scan to check for firewall existence
 * nmap\_ping\_through\_firewall - Host discovery with SYN and ACK probes instead of just pings to avoid firewall
   restrictions
 * nmap\_fast - Fast scan of the top 300 popular ports
 * nmap\_detect\_versions - Detects versions of services and OS, runs on all ports
 * nmap\_check\_for\_vulns - Uses vulscan script to check target services for vulnerabilities
 * nmap\_full\_udp - Same as full but via UDP
 * nmap\_traceroute - Try to traceroute using the most common ports
 * nmap\_full\_with\_scripts - Same as nmap\_full but also runs all the scripts
 * nmap\_web\_safe\_osscan - Little "safer" scan for OS version  as connecting to only HTTP and HTTPS ports doesn't look so attacking.

