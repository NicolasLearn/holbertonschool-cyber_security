# Projects Nmap Live Host Discovery

## Requirements

- All your scripts will be tested on Kali Linux.
- All your scripts should be exactly two lines long ($ wc -l file should print 2)
- You must substitute the IP range for $1.
- All your files should end with a new line (Why?)
- The first line of all your files should be exactly #!/bin/bash.
- A README.md file, at the root of the folder of the project, is mandatory
- You are not allowed to use backticks, &&, || or ;.
- Your code should use the Betty style. It will be checked using betty-style.pl and betty-doc.pl
- All your files must be executable
- Ensure that $1 is used without quotes in your script to prevent unintended argument type alterations.
- Warning : Don’t use " or ' surrounding $1.

## TASKS

### 0. Will arp be enough ?

Write a bash script that scan a subnetwork to discover live host using ARP scan.

    You should use nmap.
    Your code should tell nmap not to do a port scan after host discovery.
    You should run your code as privileged user. root or sudoers.
    Your script should accept a subnetwork as an arguments $1.

Depending on the scanned subnetwork, the output could change.
We can’t expect to learn about the Target MAC Address, unless we are in the the same subnetwork.

### 1. Host, do you hear me ?

Write a bash script that scan a subnetwork to discover live host using ICMP Echo scan.

    You should use nmap.
    Your code should tell nmap not to do a port scan after host discovery.
    You should run your code as privileged user. root or sudoers.
    Your script should accept a subnetwork as an arguments $1.

Depending on the scanned subnetwork, the output could change.

### 2. Time always matter

Write a bash script that scan a subnetwork to discover live host using ICMP Timestamp scan.

    You should use nmap.
    Your code should tell nmap not to do a port scan after host discovery.
    You should run your code as privileged user. root or sudoers.
    Your script should accept a subnetwork as an arguments $1.

Depending on the scanned subnetwork, the output could change.

### 3. Sometimes we need Masks !

Write a bash script that scan a subnetwork to discover live host using ICMP Address Mask scan.

    You should use nmap.
    Your code should tell nmap not to do a port scan after host discovery.
    You should run your code as privileged user. root or sudoers.
    Your script should accept a subnetwork as an arguments $1.

Depending on the scanned subnetwork, the output could change.

### 4. SYN Scan me

Write a bash script that scan a subnetwork to discover live host using TCP SYN Ping scan.

You should use nmap.
Your code should tell nmap not to do a port scan after host discovery.
Your code should scan for those ports22,80,443.
Your script should accept a subnetwork as an arguments $1.
Depending on the scanned subnetwork, the output could change.

### 5. Are your privileged enough to scan me ?

Write a bash script that scan a subnetwork to discover live host using *TCP ACK Ping * scan.

    You should use nmap.
    Your code should tell nmap not to do a port scan after host discovery.
    Your code should scan for those ports 22,80,443.
    You should run your code as privileged user. root or sudoers.
    Your script should accept a subnetwork as an arguments $1.

Depending on the scanned subnetwork, the output could change. Unprivileged users have no choice but to complete the 3-way handshake if the port is open.

### 6. UDP is our last hope

Write a bash script that scan a subnetwork to discover live host using UDP Ping scan.

    You should use nmap.
    Your code should tell nmap not to do a port scan after host discovery.
    Your code should scan for those ports 53,161,162.
    You should run your code as privileged user. root or sudoers.
    Your script should accept a subnetwork as an arguments $1.

### 7. Simple Catch, is it mimicked ?

Time To Ping The Target (cybernetsec0x04)

Catch the flag time is on, here is some tips:

    You should run your scan as privileged user. root or sudoers.
    The Current Flag is hidden within UDP opened port service VERSION
    Two hundred, Three hundred but no more. -p200-300
