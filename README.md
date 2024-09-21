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
docker tag <local_image_name>:<local_image_tag_name> <username>/<image_name_you_want>:<image_tag_name_you_want>
docker push <username>/<image_name_you_want>:<image_tag_name_you_want>

Example:
docker tag sma:stable elleined/social-media-api:latest
docker push elleined/social-media-api:latest
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
- *docker ps -a*: list all docker container in your machine.
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
- *docker network ls*: List all docker networks
```
docker network ls
```

- *docker network create*: Create a user-defined network.
```
docker network create <network_name>
```

- *docker network rm*: Delete a network
```
docker network rm <network_name>
```

### Run docker image inside user-defined network
```
docker run -itd --rm --network <network_name> --name <container_name_you_want> <image_name>
```

## Volume
- *docker volume create*: Create a volume.
```
docker volume create <volume_name>
```

- *docker volume rm*: Remove a volume.
```
docker volume rm <volume_name | volume_id>
```

- *docker volume ls*: List all volumes.
```
docker volume ls
```

- *docker volume inspect*: Return information about the specified volume
```
docker volume inspect <volume_name | volume_id>
```

## Docker Compose Commands
- *docker-compose start*: will start the stopped containers.
```
docker-compose start
```

- *docker-compose stop*: Will stop the running containers but not delete the docker compose created containers, volumes, networks, and secrets
```
docker-compose stop
```

- *docker-compose restart*: Will restart the containers
```
docker-compose restart
```

- *docker-compose up*: Will pull and run all the services in your docker compose and create the defined networks and secrets.
```
docker-compose up
```

- *docker-compose down*: Will stop and delete all the docker compose created containers, volumes, networks, and secrets.
```
docker-compose down
```

# Docker network
- Networking in docker is almost the same concept in groups of people in real world. Why I said that? When you run docker image it will create a container right? But arent you wondering what network does that container running? It is running on default docker network which is  the network name bridge and network type or driver bridge.
- If theres a default network it means that we can create our own docker network and we can run a docker container with our own docker network created.
- [Docker networking tutorial (Network Chuck)](https://www.youtube.com/watch?v=bKFMS5C4CG0)

##### Analogy: Think of group of people as network and every people want to join a group(network). And  people without a group(network) belongs to nothing in our case the default network where everyone resides. So when a people join a group(network) they will belong to that group(network) right. So in that case the people inside that group(network) will be able to communicate in isolation and security and people that are not belong to the group will not able to talk to them the same goes to them they not able to talk to peoaple outside the group.

##### NOTE: when you execute docker run without specifying the network it will reside in default network name bridge and network type bridge.

## Why docker networking important
- For you to have two container to talk to each other you need them to be running in the same network. For example you app and your app database right those two need to run in the same network to able to talk to each other.

# Docker volume
- Since container is a virtualize OS it means that they don't have data persistence and all the data will be deleted once the container is removed. And sometimes we want to save the data inside the container that why VOLUMES comes into picture, volumes are used to shared host OS files or directory inside the container or vise versa granting container and host OS to access host OS file system/ Container to have Data Persistence.

## Two ways to persist data when using containers
- *volume*: mainly used if the data does not requires direct access like databases.

- *bind mounts*: mainly use if the data requires direct access like files, pictures, videos, etc... Basically making the targeted folder behaves just like a typical shared folder.

## Why use Volumes
- Easier volume management because volumes can be manage via docker commands(Will be discussed later).
- Sharing data accross different containers.

## Docker volume syntax
- Method 1: Using a named volume and container directory.
```
docker run -v <volume_name>:<path-to-container>
```

## Docker bind mount syntax
```
docker run -v <path-to-local>:<path-to-container>
```

## Docker volume conclusion
- If you notice the docker volume uses the volume right? and the bind mount using you file system right? as first parameter. So I want you to think it this way for you to understand the concept.

So when using bind bount we are using our own file system basically just making the targeted folder behaves just like a shared folder path-to-local:path-to-container.

So when using volume itself instead of using our own file system were gonna use the docker own file system think of it as docker has his own file explorer that you cannot see. Thats why the syntax is volume-name:path-to-container. Were gonna the volume as substitute to our file system.

Thats why im saying that use volumes if you dont require a direct access in data just like databases. and use bind mount instead when you requires direct access to data like file, videos, etc...

####### Note: Docker run -v is a short version and --mount is the verbose version

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
| **ADD** | Similar to COPY, but can also extract tarballs and copy files from URLs. | ```ADD <source> <destination>```
| **WORKDIR** | Sets the working directory within the container. | ```WORKDIR <path/to/your/working_directory>```
| **USER** | Sets the user and user ID for the container process. | ```USER <user_name/ UID>```
| **CMD** | Executes a command when the container starts (only one permitted) and parameter can be overwritten | ```CMD ["<executable>","<param1>","<param2>"]```
| **ENTRYPOINT** | Defines the command(s) executed when the container starts (overrides CMD) and parameter cannot be overwritten | ```ENTRYPOINT ["<executable>", "<param1>", "<param2>"]```

## Why you need to structure properly your dockerfile
- Since every instructions in dockerfile is a layer and every layer inherits from the previous layer it is important to write your dockerfile efficiently and make the most of docker caching.
- Everytime you modify a dockerfile you need to rebuild it making your dockerfile layering important, when you rebuild dockerfile and docker engine don't see any changes from specific layer it will use the cache.
- So dockerfile structure must be from less frequent changing contens to frequently changing content.
- Because when docker see a changes from one of the layer it will rebuild all remaining layer that's why we need to place the frequently change content in the bottom of dockerfile and the less frequent to change is in top. Memory management is a must!.

###### Note: You can only have one CMD command and ENTRYPOINT in docker other commands can be executed multiple times.

# Definition of Terms
- *dockerfile instruction (FROM, COPY, etc...)*: Also the same as layer.
- *tarball*: Compressed file.

# Tutorial for Dockerization of Spring Boot with MySQL Database
- [Comprehensive YT Tutorial](https://youtu.be/PAQvxqocb6A)
- For this I will make example of my social-media-api to dockerization.

## 1. Create a network
```
docker network create <network_name>

Example:
docker network create sma-network
```

## 2. Docker pull/ run MySQL image
```
docker run -itd --rm -p <external_port>:<internal_port> --network <network_name_specified_above> --name <container_name_you_want> MYSQL_ROOT_PASSWORD=<root_password> -e MYSQL_DATABASE=<first_database_to_be_created_in_startup> <image_name>

Example:
docker run -itd --rm -p 3307:3306 --network sma-network --name sma_mysql_server -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=social_media_api_db mysql:8.0.32
```

## 3. Execute maven clean and install
```
mvn clean install
```

## 4. Go to pom.xml inside <build> tag
```
<build>
  <finalName> jar_file_name_you_want </finalName>
</build>

Example:
<build>
  <finalName> social-media-api </finalName>
</build>
```

## 5. Create Dockerfile
- For this just learn more about how to create a dockerfile. But I have example here.
```docker
FROM openjdk:17-alpine
MAINTAINER Elleined

# Docker MySQL Credentials
ENV MYSQL_HOST=sma_mysql_server
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root
ENV MYSQL_PORT=3306
ENV MYSQL_DATABASE=social_media_api_db

ADD ./target/*.jar social-media-api.jar
EXPOSE 8081
CMD ["java", "-jar", "social-media-api.jar"]

```

## 6. Make your APP application properties MySQL properties read from ENV
```
spring.datasource.url=jdbc:mysql://${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE}
spring.datasource.username=${MYSQL_USER}
spring.datasource.password=${MYSQL_PASSWORD}
```

## Docker Build your Dockerfile to create Docker image.
```
docker build -t <container_name_you_want>:<tag_name_you_want> <Dockerfile_path>

Example:
docker build -t sma:latest .
```

## 8. Docker Run your app
```
docker run -itd --rm -p <external_por>:<internal_port> --network <network_name_specified_above> --name <container_name_you_want> <image_name>

Example:
docker run -itd --rm -p 8081:8081 --network sma-network --name sma_app sma
```

# What is Docker Compose
- What is `docker-compose.yml`? It is used to easily manage multi container application using yaml file or configuration file. With just single command you can run and stop all the associated container for your app.

#### Becuase in real world suppose we have 3 entities the Frontend, Backend, and Database these three will have their own images right? and managing them individually is hard and time-consuming so docker compose came into picture where you will manage a multi-contsiner app easily.

## Docker Compose YAML Structure
```yaml
version: <docker_compose_version>
services:
  api: # You can replace api with your custom service name
    build: . # Replace . where is your Dockerfile located
    container_name: my_container # Container name you want and replacement for --name <container_name>
    restart: always # Just use `always` for restart
    ports: # List of Ports
      - "8080:8080" # Replacement for -p <external_port>:<internal_port>
    environment: # List of ENV
      - MY_KEY=MY_VALUE # Replacement for -e <my_key>=<my_value>
    networks: # List of Network
      - api_network1 # References to network you created below and replacement for --network <network_name>
    secrets:
      - api_secret1 # References to secret you created below
    depends_on: 
      db: # Will wait for the db service to up and running before running this service.
         condition: service_healthy # Will make sure db healthcheck passed
   db:
    healthcheck:
      test: # Execute a command to check if service is running correctly
      interval: 1m30s # This defines how often the health check should be run. In this case, 1m30s means it will run every 1 minute and 30 seconds.
      timeout: 10s # This sets the maximum time the health check can take to complete successfully. Here, it's set to 10s, meaning the check will be considered failed if it doesn't receive a response within 10 seconds.
      retries: 3 # This defines the number of times the health check will be retried if it fails initially. Here, it's set to 3, meaning it will attempt the check three times before considering it a complete failure.
      start-period: 2m # This defines a delay before the first health check is run after the service starts. Here, it's set to 2m, meaning the health check will wait for 2 minutes before performing the first test.

networks:
  api_network1:
    ipam:
      driver: default
    name: api_network # Replace api_network with your custom network name
    external: false # If Set to true it means that your created this network yourself
  api_network2:

secrets:
  api_secret1:
    file: /path/to/secret_file.txt # Replace the /path/to/secret_file.txt where your secret is located
    external: false # If Set to true it means that your created this secret yourself
    name: api_secret # Replace api_network with your custom secret name
  api_secret2:
```

# Magic Commands
- Forcefully deletes all stopped containers, unused networks, build cache, unused volumes and dangling images
```
docker system prune --volumes -f
```

- Deletes all docker images
```
docker rmi -f $(docker images -aq)
```
- Use this instead of docker ps -a
```
docker ps -a --format "table {{.ID}}\t{{.Status}}\t{{.Ports}}"
```
