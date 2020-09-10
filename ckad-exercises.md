# Certified Kubernetes Application Developer Practice Exercises
## Practice, Practise, Practise!!
### kubectl explain pod.spec --recursive > pod.spec
### kubectl explain deploy.spec --recursive > deploy.spec
### kubectl explain service.spec --recursive > service.spec
### export dr='--dry-run=client -o yaml'


# POD
## Create 2 individual pods
## 1. Create a nginx pod, image=nginx, pod-name: nginx-pod.  Review the YAML file created
## 2. Create a busybox pod, name=sleepy-bb, image=busybox:1.28, that sleeps for 3600 seconds "sleep 3600"
### Note 

<details><summary>show</summary>
<p>

```bash
k run nginx-pod --image=nginx 
k run nginx-pod --image=nginx  $dr > nginx-pod.yaml

k get pod nginx-pod -o yaml > nginx-pod.yaml

k edit pod nginx-pod 

k run sleepy-bb --image=busybox:1.28 --command -- /bin/sh -c "sleep 3600"

k run sleepy-bb --image=busybox:1.28 $dr --command -- /bin/sh -c "sleep 3600" > sleepy-bb.yaml

```
</p>
</details>



# Readiness and Liveness Probe on a POD
## Create a nginx pod, image=nginx, pod-name=are-you-ready-nginx, and define a readiness probe - httpGet, port 80 and path of /
## Create a nginx pod, image=nginx, pod-name=are-you-alive-nginx and define a liveness probe of TCP port 80
## Now edit the Readiness and livenessProbe to check after a delay of 30 seconds, and every 30 seconds thereafter
### Note 

<details><summary>show</summary>
<p>

```bash
k run are-you-ready-nginx --image=nginx $dr > are-you-ready-nginx.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: are-you-ready-nginx
  name: are-you-ready-nginx
spec:
  containers:
  - image: nginx
    name: are-you-ready-nginx
    readinessProbe:
      httpGet:
       path: /
       port: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}


k run are-you-alive-nginx --image=nginx $dr > are-you-alive-nginx.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: are-you-alive-nginx
  name: are-you-alive-nginx
spec:
  containers:
  - image: nginx
    name: are-you-alive-nginx
    livenessProbe:
      tcpSocket:
        port: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}



apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: are-you-ready-nginx
  name: are-you-ready-nginx
spec:
  containers:
  - image: nginx
    name: are-you-ready-nginx
    readinessProbe:
      httpGet:
       path: /
       port: 80
      initialDelaySeconds: 30
      periodSeconds: 30
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: are-you-alive-nginx
  name: are-you-alive-nginx
spec:
  containers:
  - image: nginx
    name: are-you-alive-nginx
    livenessProbe:
      tcpSocket:
        port: 80
      initialDelaySeconds: 30
      periodSeconds: 30
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}



```
</p>
</details>



# Multi-Container PODs
## Create a pod, pod name: multi-container-pod with 2 containers - busybox and nginx, name the container for busybox as "busybox1" and for nginx "nginx1". Use image as busybox:1.28 and nginx:1.15
### Note 

<details><summary>show</summary>
<p>

```bash

k run multi-container-pod --image=busybox:1.28 $dr --command -- /bin/sh -c "sleep 1d" > multi-container-pod.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: multi-container-pod
  name: multi-container-pod
spec:
  containers:
  - command:
    - /bin/sh
    - -c
    - sleep 1d
    image: busybox:1.28
    name: busybox1
    resources: {}
  - name: nginx1
    image: nginx:1.14
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}


```
</p>
</details>




# Logging into the container
## Now exec into the PODs - sleepy-bb first, followed by are-you-alive-nginx pod and the multi-container-pod
### Run the command - nslookup kubernetes.default.svc.cluster.local in the sleepy-bb pod
### Write to /usr/share/nginx/html/index.html "Hello from Kubernetes!"
### Exec into busybox1 container in the multi-container-pod and curl localhost:80

<details><summary>show</summary>
<p>

```bash

# POD1:
k exec sleepy-bb -it -- /bin/sh
nslookup kubernetes.default.svc.cluster.local

# POD2
k exec are-you-alive-nginx -it -- /bin/sh
apt-get update
apt-get install vim
echo 'Hello from Kubernetes!' > /usr/share/nginx/html/index.html
# Run this in the shell inside your container
apt-get update
apt-get install curl
curl http://localhost/
# Later we will create a service for this POD, and curl the service endpoint

# POD3
k exec multi-container-pod -c busybox1 -it -- /bin/sh
wget -O- localhost:80

```
</p>
</details>



# Service, ClusterIP and NodePort
## Create a clusterIP service, name: alive-nginx-svc for the are-you-alive-nginx POD
## Create a NodePort  service, name: alive-nginx-svc-np for the are-you-alive-nginx POD

### Note 

<details><summary>show</summary>
<p>

```bash

#ClusterIP
k expose pod are-you-alive-nginx --name=alive-nginx-svc --port=80
k expose pod are-you-alive-nginx --name=alive-nginx-svc --port=80 $dr > alive-nginx-svc.yaml

k exec sleepy-bb -it -- /bin/sh
wget -O- alive-nginx-svc:80

# NodePort
k expose pod are-you-alive-nginx --name=alive-nginx-svc-np --port=80 $dr > alive-nginx-svc-np.yaml

apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    run: are-you-alive-nginx
  name: alive-nginx-svc-np
spec:
  ports:
  - port: 80
    protocol: TCP
    nodePort: 30080
  type: NodePort
  selector:
    run: are-you-alive-nginx
status:
  loadBalancer: {}
  
  
 kubectl get nodes -o wide
 curl 192.168.205.12:30080
  
  

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






Create a ClusterIP service that exposes port 80 for the nginx pod
Create a busybox pod and hit the ClusterIP service
Create a nodePort service for the nginx pod

Create a pod with main container busybox and which executes "while true; do echo 'Hi I am busybox' >> /var/log/index.html; sleep 5; done" and with sidecar container with nginx image which exposes on port 80. Use emptyDir Volume and mount this volume on path /var/log for busybox and on path /usr/share/nginx/html for nginx container. Verify both containers are running.





At the end:
Create a deployment of nginx with 20 replicas, use image as "nginx:1.14.2"
Update the strategy to be rolling update: maxSurge of 6, max unavaiable as 3
Create an environment variable name: company; value: hitachi-vantara and use it in the deployment
Create a config map, config1 with - var1=val1, var2=val2 - use it in the deployment
Create a config map, config2, with var3=val3, and make it available to the deployment as env variable VARIABLE3
Create a config map, config3, with var4=val4, var5=val5 and mount the variables as a volume, mountPath - /etc/config, in the deployment
Create a secret, secret1 with - var1=val1, var2=val2 - use it in the deployment
Create a secret, secret2, with var3=val3, and make it available to the deployment as env variable VARIABLE3
Create a secret, secret3, with var4=val4, var5=val5 and mount the variables as a volume, mountPath - /etc/secret, in the deployment
Create an emptyDir volume and use in deployment
Create a volume with hostPath as "/usr/share/nginx/html" and use in deployment

There is a new version of the image, update your deployment to "nginx:1.15.10"

Its 3am in the morning, and you have been called to deploy "nginx:1.15.66"

