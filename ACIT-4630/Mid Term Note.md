# Cybersecurity Fundamentals: Detailed Study Guide

## 1. Attack & Threat Frameworks

- **STRIDE (Threat Modeling):**
    
    - **Spoofing:** Pretending to be someone else (violates **Authentication**).
        
    - **Tampering:** Maliciously modifying data (violates **Integrity**).
        
    - **Repudiation:** Denying an action took place because there’s no log (violates **Non-repudiation**).
        
    - **Information Disclosure:** Leaking private data (violates **Confidentiality**).
        
    - **Denial of Service:** Crashing a system (violates **Availability**).
        
    - **Elevation of Privilege:** A standard user gaining Admin rights (violates **Authorization**).
        
- **CIA Triad (The Core Goals):**
    
    - **Confidentiality:** Keeping data secret (Attack: Snooping/Sniffing).
        
    - **Integrity:** Keeping data accurate/unaltered (Attack: Man-in-the-Middle).
        
    - **Availability:** Keeping systems up and running (Attack: DoS/DDoS).
        
- **Zero-Day Vulnerability:** A security hole that is exploited **before** the developer knows it exists. There are "zero days" of protection available.
    

## 2. Hacker Profiles & Skills

- **Hacker Types:**
    
    - **White Hat:** Hired professionals (Pentesters) using skills for good.
        
    - **Black Hat:** Criminals motivated by money, ego, or malice.
        
    - **Gray Hat:** Hacks without permission (illegal) but doesn't necessarily cause harm (e.g., notifying a company of a bug).
        
    - **Hacktivist:** Hacks for a cause (e.g., Anonymous).
        
    - **Script Kiddie:** Uses "point-and-click" tools; doesn't understand the underlying code.
        
    - **State-Sponsored:** Highly funded, persistent, and targets national infrastructure.
        
- **Skill Sets:**
    
    - **Red Team:** Offensive security; simulates the "bad guy."
        
    - **Blue Team:** Defensive security; focuses on detection and incident response.
        

## 3. Vulnerabilities & Standards (The "Phonebook" of Security)

- **CVE (Exposures):** A specific ID for a specific bug (e.g., CVE-2021-44228 for Log4j).
    
- **CWE (Weaknesses):** The _type_ of mistake (e.g., "Buffer Overflow" or "Hardcoded Password").
    
- **CVSS (Scoring):** A scale of **0.0 to 10.0**. (7.0+ is usually High; 9.0+ is Critical).
    
- **Sources:** 1. **Software Bugs:** Flaws in code (e.g., SQL Injection). 2. **Misconfigurations:** Leaving default passwords (admin/admin) or open ports.
    

## 4. Malicious Activity & Social Engineering

- **Malware Types:**
    
    - **Worm:** Unlike a virus, it spreads **automatically** across a network without human help.
        
    - **Trojan:** Appears useful (like a free game) but hides a malicious payload.
        
    - **Ransomware:** Encrypts your data and demands cryptocurrency to unlock it.
        
    - **Rootkit:** Hides deep in the OS (Kernel level) so antivirus can't see it.
        
- **Botnets:**
    
    - **Command & Control (C&C):** The central server the "Botmaster" uses to send orders.
        
    - **Zombies:** The thousands of infected home computers/IoT devices waiting for orders.
        
- **Social Engineering Factors:**
    
    - **Authority:** "I'm calling from the CEO's office."
        
    - **Urgency:** "Your account will be deleted in 10 minutes!"
        
    - **Scarcity:** "Only 2 password reset slots left."
        
    - **Trust/Liking:** Building a rapport before asking for a favor.
        

## 5. Cryptography

- **Hashing:** Transforming data into a fixed-length string. **It is one-way.** (If you change one letter in a file, the "Check-sum" hash changes completely).
    
- **Digital Signatures:** The sender encrypts a hash with their **Private Key**. The receiver decrypts it with the sender's **Public Key**. This proves the message hasn't been changed (**Integrity**) and it really came from the sender (**Non-repudiation**).
    

## 6. PKI & Certificates

- **PKI:** The "Trust Factory." It includes the **CA (Certificate Authority)** which acts like a digital notary.
    
- **Verification Process:** Your browser checks the **Signature** on the certificate using the CA's public key (which is built into your OS/Browser).
    
- **Self-Signed:** Great for testing (like your lab), but triggers "Your connection is not private" errors because no trusted third party (CA) can vouch for you.
    
- **Revocation:** * **CRL:** A big list of "bad" certificates (Slow).
    
    - **OCSP:** A real-time "Is this cert still good?" check (Fast).
        

## 7. Operations & Backups

- **The 3-Circle Diagram:** The constant struggle between **Security** (locks), **Functionality** (features), and **Ease of Use** (convenience). If you increase one, you often decrease the others.
    
- **Backup Speed Comparison:**
    
    - **Full:** Everything. (Fastest Restore—you only need one file).
        
    - **Incremental:** Only what changed since _any_ previous backup. (Fastest Backup—very small files).
        
    - **Differential:** Only what changed since the last _Full_ backup. (The middle ground).