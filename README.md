# docker-notes
Notes for Docker

# What is Docker?
- Is it a lightweight and open source application used for containerization of our application.

# What is containerization
- Containerization is the process of making our application code + required dependencies into one executable package.

# Docker workflow
1. Containerize our application code + required dependency to create docker image
2. After we create docker image it will be used by other developer to run our application to their machine.
3. When other developers get our docker image and run it in their machine it will automatically create docker container.

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

# Why do we need docker?
- For different application environments
- For managing versioning of our application tech stack and dependecies.

# Commong problems that docker solves
- The legendary phrase "it works on my machine"
- Application dependecies versioning on multiple machine conflict.
- Time consuming application environment set up in multiple machines.
- Updating application dependencies in multiple machine in one place.
- For easy sharing of your application with just them literally run the project no need for them to set up anything.

# Docker Architecture
- ###### Dockerfile
- It contains a set of instructions that Docker follows to build the docker image.
- It Automate the process of building a reproducible and consistent environment for your application. 

- ###### Docker Image
- Created via dockerfile
- It is the application code + required dependencies.

- ###### Docker Registry/ Hub
- Used to store our docker image just like github.
- DockerHub
- Nexus
- JFrog
- AWS ECR
  
- ###### Docker Container
- It internally uses virtualization that means every container linux virtual machine that can run independently.
- Will be created in our local machine after we run the docker image.

# What is Virtualization?
- It is running operating system in another operating system.

# What is virtual machine?
- A virtual machine (VM) is a software-based emulation of a physical computer. It enables you to run multiple operating systems on a single physical machine that operates as an independent entity with its own virtualized hardware, including CPU, memory, storage, and network interfaces.

# How does docker become lightweight?
- Docker uses virtualization which leveraging the use of virtual machine and share the host OS kernel unlike normal virtual machine its has its own OS and separate kernel that can be resource-intensive.

# Docker Commands
## Images
###### docker pull
- pull the docker image from remote repository and download it in your local machine.
```
docker pull <image-id/ image-name>
```

###### docker images
- see the list of docker images available in your machine.
```
docker images
```
###### docker rmi
- used to delete a docker image in your machine.
```
docker rmi <image-id/ image-name>
```

###### docker run (container-creation)
- used to run docker image to create docker container in your machine.
```
docker run <image-id/ image-name> 
```

## Containers
###### docker rm
- Used to delete a docker container.
```
docker rm <container-id>
```
###### docker ps
- Used to see all the available docker container in your machine.
```
docker ps
```
