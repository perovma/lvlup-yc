#clean local
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q) -f

#https://proglib.io/p/pervoe-znakomstvo-s-kubernetes-sozdaem-pervoe-prilozhenie-dlya-razvertyvaniya-v-klastere-2021-08-04
#build and push app local
buildah push `buildah bud -f ./Dockerfile . 2>&1 | tail -n1` docker-daemon:app:v0

docker images

#test app
#docker run --rm -d -v `pwd`:/app -p 5000:5000 app:v0

#login to docker hub
docker login -u benderit

#push local image to extrenal
docker tag app:v0 benderit/app:v0
docker push benderit/app:v0
#buildah push 51cd5dcaeef4 benderit/app:v0


#test pull and run from hub
#docker run --rm -d -v `pwd`:/app -p 5000:5000 benderit/app:v0
