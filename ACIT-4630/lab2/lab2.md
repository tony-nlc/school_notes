password: `c2fefe56-ac8f-4c1c-82ad-446910c8ecbb`

IRC port: 6667
version: vsftpd 10.0.2.4

FTP port: 21
version: UnrealIRCd


version: 
- Q1: What is the purpose of the `-sn` flag in nmap?
	TCP Null scans
- Q2: In the previous lab, you used nmap to find what services running on open ports in the Metasploitable2 VM. Which nmap option (command flag) gives you the version of those services? why is it important for vulnerability scanning?
	-sV, it is important because one exploit could be fixed a patch
- Q3: Try scanning Metasploitable2 VM from your Kali machine using `-A` option with nmap. What additional information about the open ports on Metasploitable2 VM can you get by using this option?
	Enable OS detection, version detection, script scanning, and traceroute
