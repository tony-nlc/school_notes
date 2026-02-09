### Q1. Screenshots
- Running docker containers
![[Pasted image 20260205162537.png]]
-  Running Wordpress
![[Pasted image 20260205162723.png]]

### Q2. Thoughts on hardcoded credentials
![[Pasted image 20260205162952.png]]

Since source control is shared among teams or even public, here are some valid points that I found online.

1. History exposure
Even if you realize and fix hardcoded credentials in your yaml file, it is still possible for others to see the commit history to find out the plain-text credentials

2. Permission Creep
Imagine there is a new junior Frontend Develop or a  Frontend contractor, we should not give them the secret of databases. This violates the principle of giving minimum permission