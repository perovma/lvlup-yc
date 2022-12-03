sudo apt update
sudo apt upgrade
sudo apt install default-jre gnupg2 apt-transport-https wget
sudo apt install default-jre default-jdk
java -version

echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
wget https://pkg.jenkins.io/debian-stable/jenkins.io.key
sudo apt-key add jenkins.io.key
sudo apt update
sudo apt install jenkins
#sudo systemctl status jenkins
#sudo ufw allow 8080
#sudo ufw enable

sudo usermod -aG docker jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
