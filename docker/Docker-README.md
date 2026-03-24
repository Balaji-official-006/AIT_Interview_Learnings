# Docker Nginx Application

## 1 Build Docker Image

docker build -t nginx-docker-app .

## 2 Check Images

docker images

## 3 Run Container

docker run -d -p 8080:80 nginx-docker-app

## 4 Verify Container

docker ps

## 5 Access Application

http://localhost:8080
