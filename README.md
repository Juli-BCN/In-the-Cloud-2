# In the Cloud v2
Demo "In the Cloud 2" Site as an HTTPD Container


## Install Docker (based on Ubuntu 24.04) with a shell script
```bash
touch docker_install.sh
chmod +x docker_install.sh
nano docker_install.sh
```

Add the following content to the file:
```script
#!/bin/bash

# Update Ubuntu:
DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt upgrade -y

# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the latest Docker version:
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Test Docker:
docker version
```

Execute shell script:
```bash
./docker_install.sh
```


## Build
```bash
docker build -t inthecloud2:latest .
```


## Run
```bash
docker container run -d -p80:80 inthecloud2:latest
```
