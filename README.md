# kubernetes
K8S files
=========


# Creating a local repository
## Follow instructions to create a local repository
### Note: Refer youtube video: https://www.youtube.com/watch?v=r15S2tBevoE

<details><summary>show</summary>
<p>

```bash
Created VM ubuntu-01, will be using this as my registry
IP: 10.0.0.50

Uploading Vagrantfile for single-vagrant-vm, copy after === until === in a file in your local desktop, needs Oracle Virtual box and vagrant installed
===
# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|
  ##### DEFINE VM #####
  config.vm.define "ubuntu-01" do |config|
  config.vm.hostname = "ubuntu-01"
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "10.0.0.50"
  end
end
====

Logged into the machine
vagrant ssh ubuntu-01
sudo -i
apt install docker-compose
git clone https://github.com/justmeandopensource/docker
cd /root/docker/docker-compose-files/docker-registry
cp 01-plain-http.yaml docker-compose.yaml
docker-compose up -d
docker ps 
Or
docker-compose ps
docker images

Created simple Dockerfile
FROM debian:latest
CMD tail -f /dev/null

docker build -t localhost:5000/mydebian:v1 .
docker push localhost:5000/mydebian:v1

docker images localhost:5000/mydebian

Now run a container,
docker run --name mydebian -it --rm localhost:5000/mydebian:v1 bash


Now, go to the master node and run
k run mydebian --image=10.0.0.50:5000/mydebian:v1

The above will error out, because it needs secure connection, so specify insecure connection in both the nodes, node1 and node2
vi /etc/docker/daemon.json
{
        "insecure-registries": ["10.0.0.50:5000"]
} 
systemctl restart docker

```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>

# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# HEADER TEMPLATE
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>

