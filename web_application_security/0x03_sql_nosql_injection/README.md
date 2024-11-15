# Project SQL, noSQL Injection

## Requirements

- All your scripts will be tested on Kali Linux.
- All your scripts should be exactly one line long ($ wc -l file should print 1)
- All your files should end with a new line
- A README.md file, at the root of the folder of the project, is mandatory
- For this project, your focus will be on the target `cyber_websec_0x01`.
- For this Project, you are not allowed to use `sqlmap`

## TASKS

### 0. SQLi - Basic Injection Discovery

    The first step in exploiting SQL injection vulnerabilities is to identify which parameters are vulnerable.
    Your goal is to identify which parameters in the application’s web pages are susceptible to SQL injection attacks. For that you should:

        Access the machine cyber_websec_0x01 through the VPN.
        Navigate to: http://web0x01.hbtn/a3/sql_injection/. (dont forget to edit your /etc/hosts)
        Search for the vulnerable paramters.
            $ echo "paramters_name" > 0-vuln.txt

    Helpful Instructions:
        1. Start by navigating through the application's various pages.
        2. Pay special attention to any pages that display data from the database, such as product listings or user profiles.
        3. Look for URL parameters, form inputs, or any other input fields where user-supplied data is reflected in the page content or influences the data displayed.
        4. Use simple payloads such as a single quote (') or a boolean condition (' OR '1'='1) appended to parameters in URLs or input fields.
        5. Observe the application's response for any errors, unusual behavior, or changes in the displayed data that indicate a successful injection.

### 1. SQLi - Extracting Database Information

    Now that you’ve identified a vulnerable parameter, your next task is to find a flag ⛳️:

        Extract information about the database itself:
            Database Version.
            Tables.

        Helpful Instructions:
            1. To determine the Database Version, Craft a payload that causes the application to reveal the version of the database it's using.
                -  This might involve using functions like version() in MySQL or @@VERSION in Microsoft SQL Server.
            2. To identify All Table Names: Modify your payload to extract the names of all tables within the database.
                -  This will likely require knowledge of database-specific system tables or schemas (e.g., INFORMATION_SCHEMA.TABLES in MySQL).

### 2. SQLi - Data Exfiltration from a Specific Table

    With knowledge of the database structure, your goal is to extract sensitive data from a specific table.
    The target for this exercise is a flag ⛳️ stored within one of the tables you previously identified.


    Helpful Instructions:
        1. Based on your findings from Task 2, choose a table that likely contains the flag.
        2. Develop payloads that will allow you to retrieve the contents of the target table.
            - This will involve constructing queries that utilize UNION SELECT statements or other techniques suitable for data exfiltration.

### 3. SQLi - Time-Based Blind Injection

    In the realm of cybersecurity, not all vulnerabilities are visible or apparent. Blind SQL injection is a prime example of such hidden vulnerabilities.
    In this task, you are challenged to detect and exploit a blind SQL injection vulnerability where the only indication of success is a delayed response from the server.
    Your goal is to craft a payload that causes the server to return a flag ⛳️ if the query execution takes longer than 5 seconds.


    Helpful Instructions:
        1. Understanding Time-based SQL Injection
            -  Familiarize yourself with how SQL databases can be manipulated to delay responses using specific functions or commands.
        2. Your payload should incorporate a command that causes the server to wait or sleep for a specified duration (more than 5 seconds) before responding.
            -  The exact function or command will depend on the database in use (e.g., SLEEP() for MySQL, pg_sleep() for PostgreSQL, WAITFOR DELAY for SQL Server).
        3. Observing Responses:
            -  Use tools like Burp Suite to send your payloads and accurately measure the response times. This will help you fine-tune your payload to achieve the desired delay.
        4. Iterative Testing:
            - You may not get it right on the first try. Use an iterative approach, adjusting your payload based on response times, to zero in on a successful exploitation technique.

### 4. SQLi - Second-Order Blind Injection

    Second-order SQL injection requires a nuanced approach, as the payload you inject at one point is executed at another, often without direct feedback.
    This task involves submitting a payload through a registration form that seems benign until it is processed during login, revealing a flag based on a jinja error where FLAG is an accessible variable.
    Your goal is to find the flag ⛳️.

        Target URL (Initial Input):

            Endpoint: http://web0x01.hbtn/api/a3/sql_injection/second_order/register
            Method: POST
            Content-Type: JSON
            Body: Example
                {"username": "yosri", "name": "Yosri", "password": "password123"}

        Target URL (Trigger):

            Endpoint: http://web0x01.hbtn/api/a3/sql_injection/second_order/login
            Method: POST
            Content-Type: JSON
            Body: Example
                {"username": "yosri", "password": "password123"}

    Helpful Instructions:
    1. Consider how your payload can be crafted to remain dormant until triggered.
        - This might involve manipulating user data that's later used in a SQL query during login.
    2. Since you won't see direct output from your payload, think about how you can use timing attacks or monitor application behavior changes to infer success.
    3. Use tools like Burp Suite to carefully observe the application's responses and time delays when interacting with the stored payload.
    4. Be prepared to refine your payload based on feedback. This might require several attempts to fine-tune how your payload is triggered and detected.

### 5. NoSQLi - Discovering Injection Vulnerabilities

    Unlike SQL databases, NoSQL databases handle queries differently, often using JSON-like structures for queries.
    Your mission is to detect an endpoint within the application that is susceptible to NoSQL injection but NOT Harmful.
    For that you should:

        Navigate to: http://web0x01.hbtn/a3/nosql_injection. (dont forget to edit your /etc/hosts)
        Search for the vulnerable paramters.
            $ echo "/api/some_endpoint/here" > 5-vuln.txt

    Helpful Instructions:
        1. Understanding NoSQL Query Structure:
            - Familiarize yourself with how queries are constructed in NoSQL databases, such as MongoDB. Knowing the syntax for queries and operators is crucial.
        2. Manipulating Input Parameters:
            - Experiment with JSON-like syntax in input fields. For example, try injecting {"$gt": ""} to see if you can alter query logic.
        3. Observing Application Behavior:
            - Pay close attention to how the application responds to your injected payloads.
            Any change in behavior, such as returning more results than expected or errors, could indicate a vulnerability.
        4. Error Messages:
            - Sometimes, the application might display error messages that can give you hints about the backend database or its structure.
            Use this information wisely to craft more effective payloads.

### 6. NoSQLi - Bypassing Login via injection

    The application you are targeting uses a NoSQL database for user authentication.
    Due to improper input handling, it’s possible to manipulate the login query through injection.
    By crafting a specific payload, you can alter the query logic to bypass authentication checks and log in as any user, including administrative accounts.

    Your challenge is to find the flag ⛳️ by exploiting a login form.

        Target URL: http://web0x01.hbtn/a3/nosql_injection

    Helpful Instructions:
        1. Experiment with injecting JSON-like syntax into the username and password fields.
        2. Focus on operators that can modify the logic of the database query, such as $ne (not equal).
        3. Consider using the $ne operator with a value that is always true, such as {"$ne": null} or {"$ne": ""}, to manipulate query conditions.
        4. Try to target specific users by injecting payloads into the username field. Use common usernames like admin to attempt gaining administrative access.
        5. Observe how the application responds to different payloads. Successful bypass might not always be obvious and could require interpreting subtle changes in response behavior or content.

### 7. NoSQLi - Enumerating for Profit

    After mastering the technique of bypassing the login mechanism through NoSQL injection, your ultimate challenge within this project emerges.
    This task requires you to leverage your NoSQL injection skills further to enumerate login attempts.
    Your mission: identify a user profile with sufficient balance and engage in cryptocurrency exchange activities on the platform to accumulate at least 1 HBTNc coin.
    Success in this endeavor will not only demonstrate mastery of NoSQL injection techniques but also highlight your ability to apply these skills strategically for financial gain within the simulation.

        Target URL: http://web0x01.hbtn/a3/nosql_injection
    FLAG will only appear after claiming at least 1 HBTNc

    Useful instructions:
        1. Return to the login endpoint where you previously achieved bypass. This time, focus on enumerating different user profiles to find one with a notable account balance.
        2. Employ NoSQL injection techniques in the login process to iterate through user accounts. Take note of the structure and feedback from successful bypasses to refine your enumeration process.
        3. Upon identifying an account with enough balance, navigate to the cryptocurrency exchange feature within the application. Engage in transactions that will allow you to acquire at least 1 HBTNc coin.
        4. Your transactions must be carefully calculated to ensure that the account balance is exchanged for the exact or higher amount of HBTNc coins required.
        5. Monitor the application's feedback and responses closely during the exchange process. The acquisition of 1 or more HBTNc coins will trigger the appearance of a `Flag`, signifying your triumph in this comprehensive NoSQL injection challenge.

    Remember:
        - Approach this task with the mindset of a security professional, understanding that the techniques demonstrated are for educational purposes within this simulated environment.
        - The skills applied in this task should be used responsibly and ethically in real-world scenarios, adhering to legal and professional standards.
