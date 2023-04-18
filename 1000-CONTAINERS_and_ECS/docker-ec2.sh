# Install Docker Engine on EC2 Instance
sudo amazon-linux-extras install docker
sudo service docker start
docker ps
#will cause an error

sudo usermod -a -G docker ec2-user
#add user to a group that can interact with docker engine

#LOGOUT and login

sudo su - ec2-user
#login as ec2-user

# Build Docker Image
cd container
docker build -t containerofcats .
# build container image. gives location of docker file. dot at the end gives working directory
docker images --filter reference=containerofcats


# Run Container from Image
docker run -t -i -p 80:80 containerofcats
#map port 80 on the container with port 80 of instance

# Upload Container to Dockerhub (optional)
docker login --username=YOUR_USER
docker images
docker tag IMAGEID YOUR_USER/containerofcats
docker push YOUR_USER/containerofcats:latest