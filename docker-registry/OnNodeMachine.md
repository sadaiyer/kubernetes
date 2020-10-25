https://www.tecmint.com/install-run-and-delete-applications-inside-docker-containers/

docker run -it --name myubuntu ubuntu bash -c "apt-get update -y; apt-get -y install nginx" 

docker ps -l

--even though the above shows an exited...

docker commit 715a22ca2d91 myubuntu-nginx

Now, doing docker images, will show the image
docker images | grep myubuntu-nginx



Now run, docker ps, and then exec into the container

 docker run -it myubuntu-nginx   /bin/sh

 apt-get update -y
 apt-get install vim -y
 --Why, I want to install my alias into the .profile
 alias ll='ls -ltr'

 made a change to index.html, added Welcome Sada
 /usr/share/nginx/html

 Now install, awscli
 apt-get install curl -y
 apt-get install unzip -y

 curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
 unzip awscliv2.zip
 sudo ./aws/install
 exit

Now, check
docker images | grep -i myubuntu-nginx

Time to push, first commit

docker tag myubuntu-nginx docker-registry.sadaiyer.com:5000/myubuntu-nginx:v1

docker images

docker push docker-registry.sadaiyer.com:5000/myubuntu-nginx:v1

