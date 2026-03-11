#!/bin/bash

# Update system
sudo yum update -y

# Install Docker
sudo yum install docker -y

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to docker group
sudo usermod -aG docker ec2-user

# Create project directory
sudo mkdir -p /home/ec2-user/docker-project
cd /home/ec2-user/docker-project

# Create index.html
sudo tee index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title>Docker Project</title>
</head>
<body>
<h1>Hello from Docker Container</h1>
<p>Deployed automatically using EC2 User Data</p>
</body>
</html>
EOF

# Create Dockerfile
sudo tee Dockerfile <<EOF
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
EOF

# Build Docker image
sudo docker build -t nginx-docker-app .

# Run container
sudo docker run -d -p 80:80 nginx-docker-app
