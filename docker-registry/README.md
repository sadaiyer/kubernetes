Create VM using vagrantfile

#===Install docker

sudo apt-get update

#remove old versions, if required

sudo apt-get remove docker docker-engine docker.io

sudo apt install docker.io

sudo systemctl start docker

sudo systemctl enable docker

#====

Used this video to create the private docker registry
https://www.youtube.com/watch?v=SEpR35HZ_hQ&t=905s

Note that when I created certificate, I used docker-registry.sadaiyer.com as my FQDN

and both node1 and node2 have the FQDN in the /etc/hosts - instructions in OnNodeMachine.md

created alias li that lists all the images that are created

For username,password based auth, 
1. Install apache, this provides httpd

2. Create directory /registry/auth

3. htpasswd -Bbn docker-user docker-password > /registry/auth/htpasswd

4. Run docker registry - run-registry-with-htpasswd.ssh 
   
5. Create secret on K8S cluster, see script

   create-docker-secret.yaml
   
6. Run myubuntu-image-pull-secrets.yaml
