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
1. Install apache, this provides htpasswd that is used for username/password authentication

2. Create directory /registry/auth on the node where registry is running

3. htpasswd -Bbn docker-user docker-password > /registry/auth/htpasswd

4. Run docker registry - run-registry-with-htpasswd.ssh 
   
5. Create secret on K8S cluster, see script

   create-docker-secret.yaml

6. On docker-registry server (ubuntu01) , run copy-certs.sh, setup ssh-keygen so you can enable passwordless copy 

scp -p /registry/certs/domain.crt root@node1:/root

scp -p /registry/certs/domain.crt root@node2:/root

7. Now on node1 and node2, copy the certificates to the right locations

cd /etc/docker/

mkdir -p certs.d/docker-registry.sadaiyer.com:5000

cp /root/domain.crt certs.d/docker-registry.sadaiyer.com\:5000//

   
6. Run myubuntu-image-pull-secrets.yaml
