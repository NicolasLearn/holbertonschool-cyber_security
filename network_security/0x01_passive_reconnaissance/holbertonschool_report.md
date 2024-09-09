# Domain Report : Holbertonschool.com

## Introduction
This report presents a detailed analysis of the holbertonschool.com domain using the Shodan tool. The goal of this study is to examine publicly available information about subdomains, associated IP addresses, technologies used, server versions, and other technical aspects such as open ports, SSL/TLS versions, and the organizations hosting these services. This type of passive reconnaissance is useful for gaining insight into the potential attack surface of a domain.


## Summary
The analysis revealed multiple active subdomains for holbertonschool.com, each with separate IP address ranges. The web servers are primarily Nginx instances and AWS ELBs, spread across multiple countries, primarily France and the United States. Technologies used include Ruby on Rails, Google Tag Manager, and various JavaScript frameworks like jQuery. The use of different versions of SSL/TLS. Traffic is primarily routed over ports 80 and 443, with some servers also exposing ports like 8443 and 6001.

### Plages d'IP:
- **subdomain** : holbertonschool.com
    - **IP** :
        - 50.17.140.123
        - 54.173.108.112
        - 34.235.218.215
        - 54.205.160.200
        - 54.205.160.200
        - 107.22.179.152
        - 3.228.199.46

- **subdomain** : apply.holbertonschool.com
    - **IP** :
        - 15.236.252.107
        - 13.36.180.130
        - 15.237.6.72
        - 13.36.250.185
        - 35.181.238.102

- **subdomain** : read.holbertonschool.com
    - **IP** :
        - 35.180.236.179
        - 35.180.236.179
        - 35.181.224.126

- **subdomain** : staging-apply.holbertonschool.com
    - **IP** :
        - 52.47.156.150
        - 13.36.206.202

- **subdomain** : staging-apply-forum.holbertonschool.com
    - **IP** :
        - 13.38.122.220

- **subdomain** : lvl2-discourse-staging.holbertonschool.com
    - **IP** :
        - 54.224.211.11

### Ports:
- **443**/TCP: 18 instances
- **80**/TCP: 15 instances
- **8443**/TCP: 2 instances
- **22**/TCP, openSSH, Ubuntu: 1 instance
- **6001**/TCP: 1 instance

### Server:
- **Nginx**: 15 instances
    - **versions**: *1.20.0*(11) / *1.18.0*(1)
- **AWS ELB**: 4 instances
    - **versions**: *2.0*(4)

### SSL/TSL Versions:
- **tlsv1.2**: 19 instances
- **tlsv1**: 6 instances
- **tlsv1.1**: 6 instances
- **tlsv1.3**: 3 instances

### Web Technologies
- **Ruby**: 7 instances
- **Ruby on Rails**: 7 instances
- **Google Tag Manager**: 5 instances
- **Klaviyo**: 5 instances
- **Slick**: 5 instances
- **Typekit**: 5 instances
- **jQuery**: 5 instances
- **jsDelivr**: 5 instances
- **Discourse**: 2 instances
- **Abicart**: 1 instance

### Website Titles:
- **Welcome to Holberton School admission portal | Holberton School**: 5 occurences
- **503 Service Temporarily Unavailable**: 4 occurences
- **301 Moved Permanently**: 1 occurence
- **Holberton School Level2 Forum**: 1 occurence
- **Holberton School Level2 Staging Forum**: 1 occurence

### Protocol Version:
- **http/1.1**
- **h2**

### Countries
- **France**: 12 occurences
- **Usa**: 7 occurences

### Organizations
- **Amazon Data Services France**: 12 occurences
- **Amazon Technologies Inc.**: 3 occurences
- **Amazon Data Services NoVa**: 2 occurences
- **Amazon.com, Inc.**: 12 occurences

## Conclusion
This report highlights the various technical aspects of the subdomains associated with holbertonschool.com, including IP addresses, open ports, server versions, web protocols and technologies used. While the majority of servers use modern technologies, the presence of older versions of TLS and some exposed ports.
