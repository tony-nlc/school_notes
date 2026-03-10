### Q1: Who is the issuer of the two certificates?

- **Certificate 0 (Leaf/Server):** `C=US, O=DigiCert Inc, CN=DigiCert Global G2 TLS RSA SHA256 2020 CA1`
    
- **Certificate 1 (Intermediate):** `C=US, O=DigiCert Inc, OU=www.digicert.com, CN=DigiCert Global Root G2`
    

### S1: Decryption and Hash Comparison

Below is the result of the RSA decryption of the CA's signature and the expected structure of the recovered data.

**Decrypted Signature (Hex):**

> `01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003031300D06096086480165030402010500042015C4308F19FE8024FEBA0F4C09846D413FFF2C2EB7241D981A45FD5A003E839E`


---

### Q2: What data does such a certificate contain?

An X.509 certificate contains the following critical fields:

- **Subject:** The entity being identified (e.g., `*.bcit.ca`).
- **Public Key:** The RSA key used for encryption or signature verification.
- **Issuer:** The Certificate Authority (CA) that digitally signed the certificate.
- **Validity Period:** The "Not Before" and "Not After" dates.
- **Serial Number:** A unique identifier assigned by the CA.
- **Extensions:** Additional constraints, such as Subject Alternative Names (SAN) or Key Usage.
- **Signature Algorithm:** The specific algorithm used (e.g., `sha256WithRSAEncryption`).

---

### Q3: List the steps to manually verify that an X.509 certificate is authentic.

1. **Extract the Body:** Obtain the "To-Be-Signed" (TBS) portion of the certificate.
2. **Hash the Body:** Use the algorithm specified in the certificate (SHA-256) to create a digest of that body.
3. **Get the Signer's Public Key:** Retrieve the public key (e,n) from the Issuer’s certificate.
4. **Decrypt the Signature:** Use the Issuer's public key to decrypt the signature attached to the target certificate.
5. **Compare Digests:** Ensure the decrypted hash matches the hash calculated in Step 2.
6. **Check Constraints:** Verify the certificate is not expired and has not been revoked.

---

### Q4: If we only get one certificate, what does it mean? Where would we find the issuer's public key?

- **Meaning:** The server is only sending its "Leaf" certificate. It is failing to provide the "Intermediate" certificates required to complete the chain to a trusted root.
**Local Trust Store:** If the issuer is a Root CA, its public key is likely already stored in the operating system's trusted root store (e.g., `/etc/ssl/certs` on Linux).****