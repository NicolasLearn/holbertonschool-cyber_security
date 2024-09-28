# Web Fundamentals

## Requirements

- All your scripts will be tested on Kali Linux 2023.3
- All your scripts should be exactly two lines long ($ wc -l file should print 2)
- You must substitute the IP range for $1.
- All your files should end with a new line (Why?)
- The first line of all your files should be exactly #!/bin/bash.
- A README.md file, at the root of the folder of the project, is mandatory
- Your code should use the Betty style. It will be checked using betty-style.pl and betty-doc.pl
- All your files must be executable

## TASKS

### 1. Can We Trust Our Hosts?

    Write a bash script that exploit host header injection using curl.

        Initial Endpoint : http://web0x00.hbtn/reset_password
        Your script should accept the NEW HOST as ARG 1 ("$1").
        Your script should accept the TARGET URL as ARG 2 ("$2").
        Your script should accept the FORM DATA as ARG 3 ("$3").

### 2. Catch The FLAG #1

    Hints

        Check the Source-Code for known Customers emails
        A Bot will click the reset link delivered to the customer.
        The Flag will be displayed on the <header> section after you sign in as a Customer.

    Find your IP in our network

### 3. Stealing Cookies from Managers is delicious !

    Create a JavaScript payload that exploits Cross-Site Scripting (XSS) vulnerabilities within a ticketing system.

        Craft your payload using JavaScript.
            It must be encapsulated within <script> tags.
            Example format for your payload file:
                $ cat 3-xss_payload.txt
                <script>// Your JavaScript code goes here</script>
        Your code should be as short as possible.
        You are not allowed to declare any variables within your payload.
        Your payload must utilize the fetch function to send the cookies of the ticket system’s visitor.
        The cookies should be included in the request’s pathname and sent to your designated web server.
            Example: http://[your_ip]/.session=Tm90aGluZyBIZXJl]
        Target App
        Initial Endpoint : http://web0x00.hbtn/login

### 4. Catch The FLAG #2

    Hint

        A Bot will load the ticket as a Support and response to it.
        Never forget that the XSS Payload will load on your side too !
        The Flag will be displayed on the <header> section after you sign in as a Support.

### 5. Can we trust our Managers ?

    Here we are now, logged as a Support member. Now we can check tickets and reply to them!
    What’s more interesting ? Yes! the Ticket ID which smell like SQLi \o/
        Write a text file containing the HTTP Request to exploit the potential SQL Injection in the ‘Ticket ID’ parameter.
    Dev Tools -> Network, is the best path to go

### 6. Catch The FLAG #3

    Hints

        You will need the file 5-ticket.txt from the previous task.
        For the admin credentials, they could be at Admins Table. SQLmap could --dump it for you.
        You could find the Admin login page at http://web0x00.hbtn/admin.
        The Flag will be displayed on the <header> section after you sign in as an Admin.

        Target Machine

        Initial Endpoint : http://web0x00.hbtn/admin

### 7. Why would an Admin have such a function ?

    Welcome to Admin Panel ! Things are getting dangerous here..
As we notice, there is a ping check function, which the admin use to up devices.

    Write a payload that exploits poor input validation to achieve Remote Code Execution (RCE):

        Ensure there are no unnecessary spaces.
        Ensure your payload does exactly the following:
            Download the nc static binary using wget from https://github.com/yunchih/static-binaries/raw/master/nc.
            Grant execute permission to nc.
            Display the nc version using the -V option.

### 8. Catch The FLAG #4

    Hints

        Start a listner for reverse shell.
        ./nc to use netcat from the previous task.
        The Flag could be found at root‘s home directory
