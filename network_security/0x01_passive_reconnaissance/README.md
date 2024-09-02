# Passive Reconnaissance

## Requirements

- All your scripts will be tested on Kali Linux.
- All your scripts should be exactly two lines long ($ wc -l file should print 2)
- You must substitute the IP range for $1.
- All your files should end with a new line (Why?)
- The first line of all your files should be exactly #!/bin/bash.
- A README.md file, at the root of the folder of the project, is mandatory
- Your code should use the Betty style. It will be checked using betty-style.pl and betty-doc.pl
- All your files must be executable
- Ensure that $1 (or any other args) is used without quotes in your script to prevent unintended argument type alterations.

## TASKS

### 0. Who is it ?

Write a bash script that extract using whois scan in csv format:

    Registrant Information
    Admin Information
    Tech Information
You are only allowed to use awk to format your output

### 1. A record

Write a bash script that retrieve the A record of a specified domain using nslookup command:

### 2. MX Record

Write a bash script that retrieve the MX record of a specified domain using nslookup command:

### 3. Check the TXT

Write a bash script that retrieve the TXT record of a specified domain using nslookup command:

### 4. Dig it all !

Write a bash script that retrieve All record of a specified domain using dig command:

    Your output should contains answers only, noall

### 5. Find the sub !

Write a bash script that fetch subdomains of given domain using subfinder command:

    Show only subdomains in output
    Write output in Host,IP format
    File to write output to <domain>.txt

### 6. Search for us

For this task, we need you to gather as much information as possible about the holbertonschool.com domain using Shodan*:

    Collect all ip ranges within holbertonschool.com domaine
    Collect Technologies and frameworks used within all subdomains of holbertonschool.com
    Write up your notes as a report in markdown format.

### 7. Catch The flag - TXT

Here we come to our first CTF within this module. \o/

    For this challenge we are expecting you to:

        Target Domain passive.hbtn
        Connect to the VPN server
        Get a Target Machine
        Use this <target IP> as a dns resolver within dig command
            dig @<target IP> passive.hbtn

Hints

    The flag is hidden within TXT record

### 8. Catch The flag - NS

For this challenge we are expecting you to:

    Target Domain passive.hbtn
    Connect to the VPN server
    Get a cyber_netsec_0x01 Target Machine
    Use this <target IP> as a dns resolver within dig command
        dig @<target IP> passive.hbtn

Hints

    The flag is hidden within TXT record
    Try to search within nameserver domains

### 9. Catch the flag - MX

For this challenge we are expecting you to:

    Target Domain passive.hbtn
    Connect to the VPN server
    Get a cyber_netsec_0x01 Target Machine
    Use this <target IP> as a dns resolver within dig command
        dig @<target IP> passive.hbtn

Hints

    The flag is hidden within TXT record
    Try to search within mail server domains
