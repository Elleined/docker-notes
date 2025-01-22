echo "Cleaning images, containers, volumes, and network using prune command. Please Wait..."
docker image prune -f &&
docker container prune -f &&
docker volume prune -f &&
docker network prune -f
echo "Cleaning images, containers, volumes, and network using prune command. Success"

echo "Cleaning containers..."
docker stop $(docker ps -aq) &&
docker rm $(docker ps -aq)

echo "Cleaning networks..."
docker network rm $(docker network ls -q)

echo "Cleaning volumes..."
docker volume rm $(docker volume ls -q)

echo "Cleaning images..."
docker rmi -f $(docker images -aq)
