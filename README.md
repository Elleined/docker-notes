# docker-notes
Notes for Docker

# What is Docker?
-
# When do we need docker?
- Suppose you are developing an application and you already finish it, now you have these system specification to run your app in another machine.

##### Application Tech Stack
- Angular v13
- Java v17
- MySQL v8.5

##### Environment to run our application
- Install Angular v17
- Install Front-end dependencies
- Install Java v17
- Install Back-end dependencies
- Install Apache Tomcat v10
- Install MySQL Server v8.5

- Now you want to run your application to run in another machine you will set up you application environment with that machine in order to run your app and everything seems fine, but your manager says he also want it to run in his/ her machine you will go to where his/ her machine just to set up your application environment right? and everything ok, but now everyone now wants to run you application to their machine and have the application environment below specific to them what will you do now? You will now use docker help with your application environment to be set up in everyone's machine.

##### Application environments
- DEV(Development)
- SIT(System Integration Testing)
- UAT(User Acceptance Testing)
- PILOT(Pre-production environment)
- PROD(Production environment)

# Why do we need docker?
- For different application environments
- For versioning of our application tech stack and dependecies.

# Commong problems that docker solves
- The legendary phrase "it works on my machine"
- Dependecies versioning conflict
- Time consuming application environment set up
- Updating application versioning in different machine in one place.
- For easy sharing of your application with just them literally run the project no need for them to set up anything.
