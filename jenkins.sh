#!/bin/bash

echo "updating the system "
dnf -y update

echo "add epel-release repo"
dnf -y install epel-release > /dev/null 2>&1

echo "updating the system "
dnf -y update

echo "Installing java open jdk 11"
dnf -y install java-11-openjdk > /dev/null 2>&1

echo "Installing tools"
dnf -y install bash-completion vim wget curl 

echo "download jenkins repofile"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
echo "import gpg key"
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

echo "enable firewall"
systemctl start firewalld
echo "allow jenkins port in the firewall"
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload

echo "Installing jenkins"
dnf -y install jenkins > /dev/null 2>&1
systemctl start --now jenkins 
sleep 20s


echo "Installing Jenkins Plugins"
JENKINSPWD=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
echo $JENKINSPWD
ip a
