#!/bin/bash -v
apt-get update -y
apt-get install -y ansible openjdk-8-jre-headless maven awscli > /tmp/alllogs.log

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && sudo apt-get install terraform > /tmp/terraform.log

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'

apt-get update
apt-get install jenkins -y > /tmp/jenkins.log
systemctl stop jenkins.service >> /tmp/jenkins.log
systemctl start jenkins.service >> /tmp/jenkins.log
whereis jenkins >> /tmp/jenkins.log
cat /var/lib/jenkins/secrets/initialAdminPassword >> /tmp/jenkins.log

apt update
apt install docker.io -y > /tmp/docker.log
sudo systemctl start docker
sudo usermod -aG docker ubuntu >> /tmp/docker.log
logout


