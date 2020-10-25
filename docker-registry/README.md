Used this video to create the private docker registry
https://www.youtube.com/watch?v=SEpR35HZ_hQ&t=905s

Note that when I created certificate, I used docker-registry.sadaiyer.com as my FQDN

and both node1 and node2 have the FQDN in the /etc/hosts - instructions in OnNodeMachine.md

created alias li that lists all the images that are created


On Node1 and Node2, copy the domain.crt to the following location

/etc/docker/certs.d/docker-registry.sadaiyer.com:5000/

Create the director certs.d and docker-registry.sadaiyer.com:5000

On Node1
cp /root/domain.crt /etc/docker/certs.d/docker-registry.sadaiyer.com:5000/

