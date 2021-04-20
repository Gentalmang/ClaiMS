# ClaiMS

####Quick start

1. Download following:
   
    IDEA Ultimate Edition
   
    MySQL

    JDK 1.8

2. Create a new database named claims
3. Run claims.sql script file
4. Go to src/main/resources/application-dev.yml and application-pro.yml to configure url,username and password of database
5. Go to src/main/resources/application.yml to configure email service (username, password, host, properties)
6. Go to src/main/java/BootdoApplication, build and run the project
7. Open browser, go to localhost:8088/index

####Motivation
As the amount of disability claims increases,
the cost of the disability claims increases as well. 
To reduce the cost, the government want to help 
people who have disability get back to work, to do that, 
first doctors have to evaluate if someone is able to get 
back to work, however, due to problems like delayed paying 
and poor communication, doctors are not willing to do the 
evaluation since they are not sure if they can get paid by 
doing the evaluation.

####Solution
A web-based claims management system is designed and deployed to 
address problems above. The new system transfer the management mode 
of insurance business from manual recording to digital management 
and to provide convenient conditions for insurers, doctors and users, 
it also retrieves data form the NOC career handbook to make the 
system has context sensitive capture ability that can generate 
evaluation form for doctors so that it does not require insurer to 
manually evaluate the claim and decision can be made immediately, 
which means doctor can be paid once evaluation is done. 
The collected information can be analyzed and help people who 
have temporary or long term disability find new jobs so reduce t
he cost of disability benefits. An email notification system is 
implemented so that it is easy for doctors to know they get paid; 
patients to know a claim is submitted and evaluated. 