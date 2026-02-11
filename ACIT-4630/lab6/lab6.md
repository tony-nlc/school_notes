1. ![[Pasted image 20260210125751.png]]
2. ![[Pasted image 20260210125847.png]]
3. ![[Pasted image 20260210130259.png]]![[Pasted image 20260210130314.png]]
4. 

| **Step** | **Phase**           | **Action Taken**                                                                                |
| -------- | ------------------- | ----------------------------------------------------------------------------------------------- |
| **1**    | **Key Generation**  | You generate a mathematically linked **Public Key** and **Private Key**.                        |
| **2**    | **CSR Creation**    | You bundle your Public Key with your identity info (Domain, Org, Location) into a **CSR file**. |
| **3**    | **Submission**      | You send only the **CSR** to a Certificate Authority (CA) via their portal or an API.           |
| **4**    | **CA Verification** | The CA verifies you own the domain (via DNS, Email, or File checks).                            |
| **5**    | **Issuance**        | The CA signs your info with _their_ private key and sends you a **Public Certificate**.         |
| **6**    | **Installation**    | You install the issued certificate on your web server or application.                           |
5. 

| **Method**                 | **Used For**                                               |
| -------------------------- | ---------------------------------------------------------- |
| **Web Portal Upload**      | Commercial CAs (e.g., DigiCert, Sectigo)                   |
| **ACME Protocol**          | Automated CAs (e.g., Let's Encrypt, Google Trust Services) |
| **Internal Enrollment**    | Private Enterprise CAs (e.g., Microsoft ADCS)              |
| **Cloud Managed Services** | Cloud Providers (e.g., AWS ACM, Google Cloud)              |

6. 
`Issuer` attribute
7. No because CA:FALSE
8. Until 2036 Feb 8 ![[Pasted image 20260210132027.png]]
9. Untrusted Root CA
10. 