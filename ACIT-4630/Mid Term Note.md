Security Fundamentals Study Guide

1. Attack & Threat Frameworks


• STRIDE: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege.


• CIA Triad: Confidentiality, Integrity, Availability. (Identify which is violated based on the attack scenario).


• Zero-Day Vulnerability: A flaw unknown to the vendor, with no patch available.


2. Hacker Profiles & Skills


• Hacker Types:


  • White Hat: Ethical, authorized.


  • Black Hat: Malicious, unauthorized.


  • Gray Hat: Acts without permission but often without malicious intent.


  • Hacktivist: Driven by political/social causes.


  • Script Kiddie: Uses existing tools with little technical knowledge.


  • State-Sponsored: Backed by governments.


• Skill Sets: Specialized labels (e.g., Red Team/Offensive, Blue Team/Defensive).


3. Vulnerabilities & Standards (Acronyms)


• CVE: Common Vulnerabilities and Exposures.


• CWE: Common Weakness Enumeration.


• CVSS: Common Vulnerability Scoring System.


• Vulnerability Sources: Software bugs, misconfigurations.


4. Malicious Activity & Social Engineering


• Malware Types: Viruses, Worms, Trojans, Ransomware, Spyware, Rootkits.


• Botnets:


  • Components: Botmaster (C&C server), Zombies (infected hosts).


  • Function: Remote control of large-scale distributed attacks.


• Social Engineering: Phishing, Pretexting, Baiting, Quid Pro Quo, Tailgating. (Identify factors: Authority, Urgency, Scarcity, Trust).


5. Cryptography


• Symmetric: One key for encryption/decryption (Fast; e.g., AES, DES).


• Asymmetric: Public/Private key pair (Secure key exchange; e.g., RSA, ECC).


• Hashing: One-way function for integrity (e.g., SHA-256, MD5).


• Digital Signatures: Provides non-repudiation, integrity, and authentication.


• Comparison Table: 

| Feature   | Symmetric | Asymmetric              |
| :-------- | :-------- | :---------------------- |
| Key Count | 1 Private | 1 Public, 1 Private     |
| Speed     | Fast      | Slow                    |
| Usage     | Bulk Data | Key Exchange/Signatures |


6. PKI & Certificates


• PKI (Public Key Infrastructure): System to manage, distribute, and revoke digital certificates. Important for establishing trust in communication.


• Verification: Check the digital signature of the issuing CA.


• Self-Signed Certificate: Issuer and Subject are the same; not trusted by default.


• Revocation: CRL (Certificate Revocation List) or OCSP.


7. Operations & Backups


• Backup Strategies:


  • Full: Everything (Slowest backup, fastest restore).


  • Incremental: Changes since last backup (Fastest backup, slowest restore).


  • Differential: Changes since last full backup.


• 3-Circle Diagram: Security, Functionality, and Ease of Use.