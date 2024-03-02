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
## Dockerfile
- It contains a set of instructions that Docker follows to build the docker image.
- It Automate the process of building a reproducible and consistent environment for your application. 

## Docker Image
- Created via dockerfile
- It is the application code + required dependencies.

## Docker Registry/ Hub
- Used to store our docker image just like github.
- DockerHub
- Nexus
- JFrog
- AWS ECR
  
## Docker Container
- It internally uses virtualization that means every container linux virtual machine that can run independently.
- Will be created in our local machine after we run the docker image.

# What is Virtualization?
- It is running operating system in another operating system.

# What is virtual machine?
- A virtual machine (VM) is a software-based emulation of a physical computer. It enables you to run multiple operating systems on a single physical machine that operates as an independent entity with its own virtualized hardware, including CPU, memory, storage, and network interfaces.

# How does docker become lightweight?
- Docker uses virtualization which leveraging the use of virtual machine and share the host OS kernel unlike normal virtual machine its has its own OS and separate kernel that can be resource-intensive.

# Docker Commands
- *docker init*: Will initialize a docker environment in current directory. (Only executable if you have Docker Desktop installed).
  
## Images
- *docker images*: List all downloaded images in you machine.
```
docker images
```

- *docker push*: Will push a docker image from your machine to remote repository(Dockerhub).
```
docker push <image_id/ image_name>

docker push <user_name>/<repository_name>:<tag_name>
```

- *docker pull*: Will pull a docker image from remote repository(Dockerhub) to your machine.
```
docker pull <image_name>

docker pull <user_name>/<repository_name>:<tag_name>
```

- *docker rmi*: Used to delete docker image.
```
docker rmi <image_id/ image_name>
```

- *docker build*: Used to create docker image using dockerfile.
```
docker build -t <image_name_you_want>:<tag_name_you_want> <dokcer_file_location>

docker build -t my_image:my_tag .
```

## Containers
- *docker pa -a*: list all docker container in your machine.
```
docker pa -a
```

- *docker run*: Used to run docker image thus creating a docker container.
```
docker run <image_id/ image_name>
```

- *docker start*: Used to start a stopped docker container.
```
docker start <container_id/ container_name>
```

- *docker stop*: Used to stop a running docker container.
```
docker stop <container_id/ container_name>
```

- *docker rm*: Used to delete a stopped docker container.
```
docker rm <container_id/ container_name>
```

### How to connect inside the terminal of running container
```
docker exec -it <container_id> /bin/<bash | sh>

Example: docker exec -t 12345 /bin/bash
```

## Network
- *docker ls*: List all docker networks
```
docker ls
```

- *docker create*: Create a user-defined network.
```
docker create <network_name>
```

- *docker rm*: Delete a network
```
docker rm <network_name>
```

### Run docker image inside user-defined network
```
docker run -itd --rm --network <network_name> --name <container_name_you_want> <image_name>
```

# Docker network
- Networking in docker is almost the same concept in groups of people in real world. Why I said that? When you run docker image it will create a container right? But arent you wondering what network does that container running? It is running on default docker network which is  the metwork name bridge and network type or driver bridge.
- If theres a default network it means that we can create our own docker network and we can run a docker container with our own docker network created.
- [Docker networking tutorial (Network Chuck)](https://www.youtube.com/watch?v=bKFMS5C4CG0)

##### Analogy: Think of group of people as network and every people want to join a group(network). And  people without a group(network) belongs to nothing in our case the default network where everyone resides. So when a people join a group(network) they will belong to that group(network) right. So in that case the people inside that group(network) will be able to communicate in isolation and security and people that are not belong to the group will not able to talk to them the same goes to them they not able to talk to peoaple outside the group.

##### NOTE: when you execute docker run without specifying the network it will reside in default network name bridge and metwork type bridge.

## Why docker networking important
- For you to have two container to talk to each other you need them to be running in the same network. For example you app and your app database right those two need to run in the same netowrk to able to talk to each other.

# Dockerfile
- Used to create a docker image.

## Dockerfile basic structure
- [For more reference about building dockerfile](https://kapeli.com/cheat_sheets/Dockerfile.docset/Contents/Resources/Documents/index)

| Instruction | Description | Syntax
|---|---|---|
| **FROM** | Specifies the base image to inherit from. | ```FROM <image_name>```
| **MAINTAINER** | Sets the author of the image. |  ```MAINTAINER <name>```
| **RUN** | Executes any linux commands during the image build process. | ```RUN ["<executable>", "<param1>", "<param2>"]```
| **ENV** | Sets environment variables accessible within the image and running container. | ```ENV <key> = <value>```
| **COPY** | Copies files or folders from the host system into the image. | ```COPY <source> <destination>```
| **EXPOSE** | Informs Docker that the container listens on specific ports at runtime (doesn't publish ports). | ```EXPOSE <port>```
| **ARG** | Declare private variable only accessible within the dockerfile. | ```ARG <key> = <value>```
| **ADD** | Similar to COPY, but can also extract tarballs and copy files from URLs. |
| **WORKDIR** | Sets the working directory within the container. | ```WORKDIR <path/to/your/working_directory>```
| **USER** | Sets the user and user ID for the container process. | ```USER <user_name/ UID>```
| **CMD** | Executes a command when the container starts (only one permitted). | ```CMD ["<executable>","<param1>","<param2>"]```
| **ENTRYPOINT** | Defines the command(s) executed when the container starts (overrides CMD). | ```ENTRYPOINT ["<executable>", "<param1>", "<param2>"]```

## Why you need to structure properly your dockerfile
- Since every instructions in dockerfile is a layer and every layer inherits from the previous layer it is important to write your dockerfile efficiently and make the most of docker caching.
- Everytime you modify a dockerfile you need to rebuild it making your dockerfile layering important, when you rebuild dockerfile and docker engine don't see any changes from specific layer it will use the cache.
- So dockerfile structure must be from less frequent changing contens to frequently changing content.
- Because when docker see a changes from one of the layer it will rebuild all remaining layer that's why we need to place the frequently change content in the bottom of dockerfile and the less frequent to change is in top. Memory management is a must!.

###### Note: You can only have one CMD command and ENTRYPOINT in docker other commands can be executed multiple times.

# Definition of Terms
- *dockerfile instruction (FROM, COPY, etc...)*: Also the same as layer.
- *tarball*: Compressed file.
