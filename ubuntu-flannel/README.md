# k8s-vagrant-virtualbox
Create a local kubernetes cluster using virtualbox.  

The vagrant file will do the following:
1.  Provision all local VMs using VirtualBox
2.  Patch the OS
3.  Install Docker
4.  Install k8s control plane
5.  Initialize cluster with Flannel CIDR block & install Flannel
6.  Join the nodes to the master
7.  Create and copy the SSH key to all machines so you can SSH to any node from the Master.  Add names & IPs to the local hosts file on each master and node.  Create alias in vagrant home for kubectl...just use k
8.  Make required Ubuntu OS mods for the cluster to function properly

## Dependencies

You should install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) before you start.

Open a shell and install the vagrant disksize plugin:
```bash
$ vagrant plugin install vagrant-disksize
```

## Make sure git is installed

Instal [git](https://git-scm.com/downloads) if you don't already have it.

## Open a shell and clone

```bash
$ git clone git@github.com:LocusInnovations/k8s-vagrant-virtualbox.git
$ cd k8s-vagrant-virtualbox
```

## Starting the cluster

You can create the cluster with:

```bash
$ vagrant up
```

## Clean up

You can delete the cluster with:

```bash
$ vagrant destroy -f
```

## SSH and other Commands

SSH to Master and other Nodes:

```bash
$ vagrant ssh master
$ vagrant ssh node1
$ vagrant ssh node2
$ vagrant ssh node3
```

Get the status of the Nodes:

```bash
$ k get nodes -o wide
NAME     STATUS   ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
master   Ready    master   16m     v1.17.4   10.0.0.10     <none>        Ubuntu 18.04.4 LTS   4.15.0-88-generic   docker://19.3.6
node1    Ready    <none>   11m     v1.17.4   10.0.0.11     <none>        Ubuntu 18.04.4 LTS   4.15.0-88-generic   docker://19.3.6
node2    Ready    <none>   6m31s   v1.17.4   10.0.0.12     <none>        Ubuntu 18.04.4 LTS   4.15.0-88-generic   docker://19.3.6
node3    Ready    <none>   102s    v1.17.4   10.0.0.13     <none>        Ubuntu 18.04.4 LTS   4.15.0-88-generic   docker://19.3.6
```

SSH to other Nodes in the cluster from the Master:

```bash
$ ssh node1
$ ssh node2
$ ssh node3
```
