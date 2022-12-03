#debian 11
sudo apt update
sudo apt-get -y install buildah python3 python3-pip bash-completion

#docker
sudo apt -y install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

#cubectl
#https://kubernetes.io/ru/docs/tasks/tools/install-kubectl/
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl

#yandex cloud client
#https://cloud.yandex.ru/docs/cli/quickstart#install
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
sudo cp yandex-cloud/bin/yc /usr/bin/
yc init

#configure kubectl
CLUSTER_NAME='lvlup-k8s'
yc managed-kubernetes cluster get-credentials $CLUSTER_NAME --external --force
#check it
kubectl cluster-info

#configure buildah
sudo wget https://raw.githubusercontent.com/containers/buildah/main/docs/samples/registries.conf -O /etc/containers/registries.conf
