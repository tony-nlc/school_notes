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

