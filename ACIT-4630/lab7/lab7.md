![[Pasted image 20260216155051.png]]

Q1. It is consider an online attack because we are send request to a live server over the network.

Q2. This is a dictionary attack because we have a predefined list of password.

Q3. MFA could be a solution here because it requires an authentication from a second code.

```
$oldoffice$1*b405d2e0bef836cd538b96de63d64cfd*7c33fab607ed148ae5f2ca3ee8ca4c0b*e0e9f79eabc501653af0543e027f0cad
```
Q4. It would be not be a good choice for brute-force attack because many website has rate limiting and brute force attack requires too much trials

Q5. 
![[Pasted image 20260216161021.png]]

Q6. 
This is a dictionary attack because we have a predefined list.

Q7. 

| Feature | Online Attack | Offline Attack |
| ------- | ------------- | -------------- |
| Speed   | Slow          | Fast           |
| Stealth | Low           | High           |

Q.8

1. Increase Password Entropy: Using long, complex passwords (passphrases) ensures they won't be in a common dictionary like `rockyou.txt` and would take centuries to brute-force.
2. Key Stretching (Salting and Hashing): Use modern algorithms like Argon2 or bcrypt with high "cost factors." This forces the computer to do more work for every single guess, slowing the attacker down from millions of guesses per second to just a few.



![[Pasted image 20260216165107.png]]

Q9. What’s the purpose of the `-m 100` option?

The `-m` flag stands for Hash Type. In Hashcat, every hashing algorithm is assigned a specific numeric code so the software knows how to process the data.

- `-m 100` specifically tells Hashcat that the input hashes are SHA1.

Q10. 
It is still a dictionary attack.

Q11.
![[Pasted image 20260216165723.png]]

Q12. 
It applies different variation of password
automatically try common variations like:

- **Capitalization:** `Password`
- **Leet-speak:** `p4ssword`
- **Duplication:** `passwordpassword`
- **Common symbols:** `password!`