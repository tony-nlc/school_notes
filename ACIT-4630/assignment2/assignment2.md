 **Question 1: Non-multiple of 64 prefix?**

The `md5collgen` tool will **pad** the prefix with zero bytes (`0x00`) until it reaches the nearest multiple of 64 bytes. This ensures the collision blocks start at a clean MD5 block boundary.

 **Question 2: Prefix exactly 64 bytes?**

Even if the prefix is exactly 64 bytes, the tool may still append a full **64-byte block of padding** (zeros) before adding the 128-byte collision data. The output files will always be larger than the original prefix by a multiple of 64.

 **Question 3: Are the 128 bytes completely different?**

**No.** Most of the 128 bytes are identical. Only a few specific bytes (typically around 2–6 bytes) will differ between `out1.bin` and `out2.bin`. These precise differences are engineered to "cancel out" during the MD5 compression process.

### Task 1
![[Pasted image 20260218171519.png]]


### Task 2
![[Pasted image 20260218171612.png]]

### Task 3
![[Pasted image 20260218182009.png]]

### Task 4
![[Pasted image 20260218183214.png]]

### 1. Non-Repudiation Scenario

MD5 is weak because of **collisions**. If Adam creates two versions of a program—**Benign (A)** and **Malicious (B)**—that share the same MD5 hash, he can:

1. Submit **Program A** to a trusted site for verification.
2. The site publishes the "safe" MD5 hash.
3. Adam provides **Program B** to users.
4. Users check the hash, see it matches the trusted site, and run the malware.

If caught, Adam can **repudiate** (deny) the attack by claiming he only wrote the benign version and that the collision was a coincidence or created by someone else.

### 2. Vulnerable Algorithms

The following are mathematically broken and susceptible to collision attacks:

- **MD5** (Broken in seconds)
- **SHA-1** (Proven vulnerable; "SHAttered" attack)
- **MD4** (Extremely old and broken)
### 3. Safe Algorithms

These are currently the industry standard for security:

- **SHA-256 / SHA-512** (Part of the SHA-2 family)
- **SHA-3** (The newest NIST standard)
- **BLAKE3** (Modern, fast, and secure)