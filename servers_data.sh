
#!/bin/bash -v
apt-get update -y
apt-get install -y ansible > /tmp/logs.log

apt update
apt install docker.io -y > /tmp/docker.log
sudo systemctl start docker
sudo usermod -aG docker ubuntu >> /tmp/docker.log
logout



