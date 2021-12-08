sudo yum install docker 
docker --version
sudo yum install -y git
sudo service docker start
sudo systemctl enable docker
git clone -b new https://github.com/TeenaKohli/petkeepers.git
cd petkeepers
sudo docker build --pull --rm -f "Dockerfile" -t petkeepers-service:latest "."
sudo docker run --name petkeepers-app  -p 8080:8080 -d petkeepers-service:latest
