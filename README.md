# kubernetes
K8S files

1. Create the VMS using vagrantfile
2. Generate a KEY-PAIR to access all the machines from the master node

Generate Key Pair on master-1 node 
$ssh-keygen

Leave all settings to default.

View the generated public key ID at:

$cat .ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD......8+08b vagrant@master-1
Move public key of master to all other VMs

$cat >> ~/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD......8+08b vagrant@master-1
EOF


3. Make entries in /etc/hosts on all the nodes
cat /etc/hosts
192.168.205.10  k8s-head
192.168.205.11  k8s-node-1
192.168.205.12  k8s-node-2

4. Ensure you are able to login from master to nodes "silently"

5. Follow K8S doc - summarized in "cluster-creation" file (copied below too)
Step1: On-ALL NODES
lsmod | grep br_netfilter
#if not there, then 
sudo modprobe br_netfilter

Step2: ON-ALL NODES

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system


Step3: ON-ALL NODES

sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl



STEP4: On MASTER - AS ROOT (See issue: https://github.com/weaveworks/weave/issues/3758)
kubeadm init --apiserver-advertise-address=192.168.205.10 --pod-network-cidr=10.32.0.0/12 


STEP5: 
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

STEP6: Install CNI

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"



