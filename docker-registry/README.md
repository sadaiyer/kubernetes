Used this video to create the private docker registry
https://www.youtube.com/watch?v=SEpR35HZ_hQ&t=905s

Note that when I created certificate, I used docker-registry.sadaiyer.com as my FQDN

and both node1 and node2 have the FQDN in the /etc/hosts - instructions in OnNodeMachine.md

created alias li that lists all the images that are created

For username,password based auth, use the run-registry-with-htpasswd.ssh first
and then create secret on K8S cluster, see script
create-docker-secret.yaml
