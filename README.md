# ClaiMS
***

## Table of Content
* [Background](#Background)
  * General
    *  Problems
    *  Solution
  * Technical
* [Quick Start](#Quick Start)
* [Function Demo](#Function Demo)
  * Log in
  * System
    * User
    * Role
  * Claims management
  * Claiming form
* [Resources](#Resources)
  * NOC
  * Open source projects
  * Tech stack
* [Next Step](#Next Step)




### Background

***

#### General
There are several problems of the traditional disability benefits claiming process.

##### Problems
1.  `Paper Data` Natural language and hand-writing on paper is hard to recognize, understand, store, transfer, analyze and reuse.
2.  `Delayed Decision Making` Normally it takes several weeks to make decision.  
3.  `Poor Communication` There are hardly communications between patients, doctors and insurers.
4.  `Inflexible Questions` Questions on assessment forms are not relevant to the jobs of the patient, unnecessary questions will be asked sometimes

According to WorkSafe NB, around 27 billion was spending on disability benefits every year,
and the government want to help people who have disability find new job, 
so that reduce the cost of disability benefits.

To help people who have disability find new job,
first doctors have to evaluate if someone is able to get back to work.

However, due to the problems discussed above, doctors are not willing to do 
the evaluation since they are not sure if they can get paid by doing that.

##### Solution
An online web app with following features:

1. Connects to a database.
2. Can generate claiming forms and make decision immediately according to the [NOC](#NOC)
3. Has an email notifier.

***

### Quick Start

1. Download following:
   
    [IDEA Ultimate Edition](https://www.jetbrains.com/idea/download/#section=windows) (or something similar)
   
    [MySQL](https://dev.mysql.com/downloads/mysql/)

    [JDK 1.8](https://www.oracle.com/ca-en/java/technologies/javase/javase-jdk8-downloads.html)

2. Create a new database named claims 
    
   `CREATE DATABASE claims`
3. Run claims.sql script file ~~(I assume people who staring at this line would use MySQL WorkBench)~~
   
![](/img/runScript.jpg =250x)
4. Go to src/main/resources/application-dev.yml and application-pro.yml to configure url,username and password of database
5. Go to src/main/resources/application.yml to configure email service (username, password, host, properties)
6. Go to src/main/java/BootdoApplication, build and run the project
7. Open browser, go to localhost:8088/index

***

### Function Demo
#### Log in
![](/img/log in.jpg =250x)
#### System
System module mainly contains user, role and department management. 
##### User
![](/img/InkeduserManagement.jpg =250x)
User can be assigned multiple roles.
![Add User](/img/InkedAddUser.jpg =250x)
##### Role
Permission to pages (in a tree structure) can be granted to roles. 
![](/img/permission.jpg =250x)
#### Claims management
There are three pages for claims management.
1. "My Claims" for users to see their own claims

![](/img/userClaims.jpg =250x)
2. "Claims Management" for doctors to see, and evaluate all claims assigned to them.

3. "Claims Management" for insurers to get, set or delete all claim.

![](/img/allClaims.jpg=250x)

#### Claiming form
Claiming form asks information about the user, user's company and user's current situation.

Questions about person's current situation is generated according to NOC.

![Job](/img/jobInfo.jpg=250x)
![Patient's current situation](/img/Inkedpatient'sSituation.jpg=250x)

***

### Resources
#### NOC
NOC stands for the National Occupational Classification, it subdivides occupations 
according to occupational categories, and the skill requirements of occupation to form
a collection of jobs in Canada.

More information please see: [here](https://noc.esdc.gc.ca/)

#### Open Source Project
The system module of bootdo is used in ClaiMS. Link: [here](https://github.com/lcg0124/bootdo)

#### Tech stack
1. Backend: SpringBoot, Shiro, Thymeleaf, MyBatis
2. Frontend: jQuery, jsTree, bootstrapTable
3. Database: MySQL

***

### Next Step
1. Connect the system to the NOC in real time.
2. Help people find jobs according to the information gathered.
3. A find doctor module to help user find doctors nearby them.
