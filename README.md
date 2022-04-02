# DevOps Spring School 2022
## Initial preparation for logging task results
- Create repository on github
- Clone repository to local machine
  <details>
  <summary>Steps to clone GitHub over SSH</summary>
  <p>To perform a GitHub clone with SSH keys in Git, simply follow these steps:

    1. Create an SSH keypair on your Windows or Linux OS
    2. Copy the value of the public SSH key to your GitHub account
    3. Obtain the GitHub SSH URL for the repository to be cloned
    4. Using Git, clone from GitHub with the SSH URL 
    </p>

    [Reference link][clone_rep] </details>
    
- Documenting results and adding them to git
  
## Bash (Task #1)
### Title: Create scenario to change the owner of files and folders

#### Parameters:
`$1 <username>` <br>
`$2 <directory>`

#### Requirements:
`$1` – should be existing user in your OS (in your script the checking block should be present) <br>
`$2` – should be only the directory (also need to be checked in your script)

#### [Task #1. Solution][task1]

## LMS Moodle (LAMP / LEMP Stack) (Task #2)
## Task #2.1 
### Title: Prepare Environment for deploying LMS Moodle (LAMP / LEMP Stack)

#### Requirements:

`1 server` `(2 GiB RAM, 1 vCPU, 10 GiB)` <br>
There is no any restrictions for server’s parameters


Server can be created using Oracle Virtual Box or any other similar software or you can
use IaaS approach and order some server in cloud providers like: AWS, GCP, Azure or
any other (Digital Ocean, Hetzner, ….)

#### Install needed software
- Install MySQL 5.7.x, 8.x (Mariia DB)
- Install Apache HTTP Server / NGINX HTTP Server
- Install PHP ≥ 7.x (all needed extends for LMS Moodle)

Deploying LMS Moodle

## Task #2.2
### Title: Create bash script for making dump of database

Create bash script for making dump of database and write this dump to
the file with name like following: `moodle_<currentdate_currenttime>.sql`

## Task #2.3
### Title: Connecting Moodle to a remote database

Separate webserver + PHP and DB Server between two virtual servers

#### [Task #2. Solution][task2]

[clone_rep]: <https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/github-clone-with-ssh-keys>
[task1]: <https://github.com/ksenka549/devops/tree/main/bash>
[task2]: <https://github.com/ksenka549/devops/tree/main/bash>
