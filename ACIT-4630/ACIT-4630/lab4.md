

Q1. Mail System Daemon Auth
Q2. type and path
Q3. Successful login and failed login
![[Pasted image 20260127141413.png]]
Q4. Backing up log history
Q5. Syslog daily 
	Mail 7 days
	dmesg 2 days
	Auth Log 7 days
	Daemon 7 days
Q6. Depends
Q7. Access Breached Log
	Error Log
	Access Log
Q8
![[Pasted image 20260127145725.png]]
Q9. `<IP> - - <TIME> "<METHOD> <REQUEST LINE>" <STATUS CODE> <SIZE> "-" <HEADER> <USER-AGENT>`

Q10. The IP address of Kali machine

Q11. `  cat access.log | cut -d " " -f 1,4 | uniq -c | sort -n

Q12. ![[Pasted image 20260127151432.png]]

Q13. ![[Pasted image 20260127152219.png]]