
## 1. Attack & Threat Frameworks

### CIA Triad (The Goals)

When an attack happens, identify what was lost:

- **Confidentiality:** Data was seen by someone who shouldn't have. (_Ex: A data breach/sniffing_).
- **Integrity:** Data was changed or modified. (_Ex: An attacker changes a bank balance_).
- **Availability:** The system is down or slow. (_Ex: A DDoS attack_).

### STRIDE (The Threats)

| Threat                     | Violation           | Example                                               |
| -------------------------- | ------------------- | ----------------------------------------------------- |
| **S**poofing               | **Authentication**  | Faking an identity (IP spoofing, email spoofing).     |
| **T**ampering              | **Integrity**       | Modifying a file or a packet in transit.              |
| Repudiation                | **Non-repudiation** | Denying you sent a message because there are no logs. |
| **I**nformation Disclosure | **Confidentiality** | Leaking private database records.                     |
| **D**enial of Service      | **Availability**    | Crashing a website so legitimate users can't enter.   |
| **E**levation of Privilege | **Authorization**   | A standard user gaining Admin/Root access.            |

---

## 2. Hacker Profiles & Skills
- **White Hat:** Ethical/Legal (Pentesters).
- **Black Hat:** Malicious/Illegal (Criminals).
- **Gray Hat:** Hacks without permission but usually without "malice" (e.g., to find a bug).
- **Hacktivist:** Hacks for a political or social cause (e.g., Anonymous).
- **Script Kiddie:** Uses pre-made tools; doesn't understand the code.
- **State-Sponsored:** Highly funded by a government (APT - Advanced Persistent Threat).

**The Labels:**
- **Red Team:** Offensive (The Attackers).
- **Blue Team:** Defensive (The Defenders/Detection).

---

## 3. Vulnerabilities & Acronyms
- **Zero-Day:** A vulnerability exploited **before** a patch is available.
- **CVE (Common Vulnerabilities & Exposures):** A list of publicly disclosed cybersecurity bugs (The ID number).
- **CWE (Common Weakness Enumeration):** The **category** of the flaw (e.g., "Buffer Overflow").
- **CVSS (Common Vulnerability Scoring System):** The **score** (0-10) of how dangerous it is.
- **Sources of Vulnerabilities:** 1. **Software Bugs** (bad code) 2. **Misconfigurations** (weak passwords/open ports).

---

## 4. Malware & Botnets
- **Worm:** Spreads **automatically** across a network (no human help).
- **Trojan:** Disguised as something useful (e.g., a "free" game).
- **Ransomware:** Encrypts your data for money.
- **Rootkit:** Hides at the **Kernel level** (deep OS) to avoid detection.

**Botnets:**
- **Components:** **Botmaster** (Attacker), **Command & Control (C&C)** server, and **Zombies/Bots** (Infected devices).
- **How they work:** The Botmaster sends a command to the C&C, which pushes the order to thousands of Zombies to launch a DDoS attack.

---

## 5. Social Engineering Factors
- **Authority:** "I'm the IT Director, give me your password."
- **Urgency:** "Your account will be deleted in 5 minutes!"
- **Scarcity:** "Only 3 reset links left today."
- **Trust/Liking:** Building a friendly rapport before asking for a favor.

---

## 6. Backups & Operations
**The 3-Circle Diagram:** The struggle between **Security**, **Functionality**, and **Ease of Use**. If you increase one, the others typically suffer.
**Backup Strategies:**
- **Full:** Everything. **Fastest Restore** (only 1 file needed). **Slowest Backup**.
- **Incremental:** Changes since _any_ last backup. **Fastest Backup**. **Slowest Restore** (Needs Full + every increment).
- **Differential:** Changes since the last _Full_. Medium speed for both.

---

## 7. Cryptography & PKI
### Comparison Table
| Feature      | Symmetric                 | Asymmetric                        |
| ------------ | ------------------------- | --------------------------------- |
| **Keys**     | **1 Key** (Shared Secret) | **2 Keys** (Public & Private)     |
| **Speed**    | **Very Fast**             | **Slow**                          |
| **Use Case** | Bulk data / Hard drives   | Key Exchange / Digital Signatures |
| **Algos**    | **AES**, DES, 3DES        | **RSA**, ECC, Diffie-Hellman      |
### Digital Signatures (The Opposite Logic)

- **Encryption:** I use **YOUR Public Key** (Only you can open it).
- **Signature:** I use **MY Private Key** (Everyone uses my Public Key to verify it's really me).

**Hashing:** One-way math. Used for Integrity.

- **Algorithms:** **SHA-256**, MD5 (weak), SHA-1 (weak).

### PKI & Certificates

- **PKI (Public Key Infrastructure):** The framework that manages trust.
- **Server Certificate Attributes (Lab 6):** Common Name (the domain), Organization, Country, and the **Public Key**.
- **Verification:** Your browser uses the **CA's Public Key** to decrypt the signature on the **Server Certificate**.
- **Revocation:** **CRL** (a list) or **OCSP** (a real-time status check).
- **Self-Signed:** Recognized if the **Issuer** and the **Subject** are the same name.