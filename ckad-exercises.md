# Certified Kubernetes Application Developer Practice Exercises
## Practice, Practice, Practice!!
## In Australian and British English, 'practise' is the verb and 'practice' is the noun. In American English, 'practice' is both the verb and the noun.
### kubectl explain pod.spec --recursive > pod.spec
### kubectl explain deploy.spec --recursive > deploy.spec
### kubectl explain service.spec --recursive > service.spec
### export dr='--dry-run=client -o yaml'
### kubectl create objectName -h | grep -i '#' -A 2
### kubectl create cj -h | grep -i '#' -A 2

## My aliases...
<details><summary>show</summary>
<p>

```bash
alias k='kubectl'
alias kgp='k get pods'
alias kgd='k get deploy'
alias kgs='k get svc'
alias kcf='k create -f'
alias dp='k get pods;read -p "Enter podName:" podName;k delete pod $podName --force --grace-period=0;k get pods'
alias sc='k get ns;read -p "Enter nSpace:" nSpace;k config set-context --current --namespace=$nSpace;k config view --minify | grep namespace;export PS1="\[\]\u:\H:$nSpace:$ "'
alias c='clear'
export dr='--dry-run=client -o yaml'

alias bb='k run bb --image=busybox:1.28 --restart=Never --rm -it -- /bin/sh -c "sleep 3600"'
alias ac='k run ac --image=sadaiyer/alpine-curl --restart=Never --rm -it '

export EDITOR=vi
export KUBE_EDITOR=vi
alias kgn='kubectl get nodes'
alias kdp='kubectl describe pod '
alias wn='kubectl config view | grep namespace'
export KN=' -n kube-system'
alias kw='kgp -o wide -w'
alias kj='kubeadm token create --print-join-command'
alias kh='kubectl get cs;kubectl cluster-info;kubectl version --short; kubeadm alpha certs check-expiration'
c


```
</p>
</details>


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



# Create 3 pods 
In the default namespace, nginx-pod (image: nginx), busybox-pod (image:busybox;1.28, sleep 1d) and bash-pod (image: bash, sleep 3600 seconds)
<details><summary>show</summary>
<p>

```bash
k run  --generator=run-pod/v1 nginx-pod --image=nginx
k run  --generator=run-pod/v1 busybox-pod --image=busybox:1.28 --command -- /bin/sh -c "sleep 1d"
k run  --generator=run-pod/v1 bash-pod --image=bash --command -- /bin/sh -c "sleep 3600"
```
</p>
</details>


# Create 3 deployments 
In the default namespace, deployment 1: name: nginx-deploy, image: nginx:1.14 replicas: 2, labels: app=partner-portal tier=app cost-center=123, annotate deployment as 'nginx-1.14-custom approved-infosec'

<details><summary>show</summary>
<p>

```bash
k create deploy nginx-deploy --image=nginx:1.14 --dry-run -o yaml > nd.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: partner-portal         #change
    tier: app                   #add
    cost-center: "123"          #add
  name: nginx-deploy
  namespace: default            #add
spec:
  replicas: 2           #add
  selector:
    matchLabels:
      app: partner-portal               #change
      tier: app                         #add
      cost-center: "123"                        #add
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: partner-portal             #change
        tier: app                       #add
        cost-center: "123"              #add
    spec:
      containers:
      - image: nginx:1.14
        name: nginx
        resources: {}
status: {}

k annotate deploy nginx-deploy kubernetes.io/change-cause="nginx-1.14-custom approved-infosec"
or
you can add the annotation directly in above yaml file:
kind: Deployment
metadata:
  annotations:
    kubernetes.io/change-cause: "nginx-1.14-custom approved-infosec"
    
k rollout history deploy nginx-deploy

```
</p>
</details>

In the default namespace,  deployment 2: name: redis-deploy, image: redis replicas: 1, labesl:  labels: app=partner-portal tier=cache cost-center=123, annotate deployment as 'redis-custom approved-infosec'

<details><summary>show</summary>
<p>

```bash
k create deploy redis-deploy --image=redis --dry-run -o yaml > rd.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: partner-portal         #change
    tier: cache                 #add
    cost-center: "123"          #add
  name: redis-deploy
  namespace: default            #add
spec:
  replicas: 1
  selector:
    matchLabels:
      app: partner-portal         #change
      tier: cache                 #add
      cost-center: "123"          #add
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: partner-portal         #change
        tier: cache                 #add
        cost-center: "123"          #add
    spec:
      containers:
      - image: redis
        name: redis
        resources: {}
status: {}

k annotate deploy redis-deploy kubernetes.io/change-cause="redis-custom approved-infosec"

k rollout history deploy redis-deploy

```
</p>
</details>


In the default namespace, deployment 3: name: mysql-deploy, image: mysql replicas: 1, labels:  labels: app=partner-portal tier=db cost-center=123, annotate deployment as 'mysql-custom approved-infosec'

<details><summary>show</summary>
<p>

```bash
k create deploy mysql-deploy --image=mysql --dry-run -o yaml > md.sql

apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: partner-portal         #change
    tier: cache                 #add
    cost-center: "123"          #add
  name: mysql-deploy
  namespace: default            #add
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql-deploy
      app: partner-portal         #change
      tier: cache                 #add
      cost-center: "123"          #add
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: partner-portal         #change
        tier: cache                 #add
        cost-center: "123"          #add
    spec:
      containers:
      - image: mysql
        name: mysql
        env:
        - name:  MYSQL_ROOT_PASSWORD
          value: password
        resources: {}
status: {}

k annotate deploy mysql-deploy kubernetes.io/change-cause="mysql-custom approved-infosec"

 k rollout history deploy mysql-deploy
 
```
</p>
</details>



# Config Maps
## Create config map, configmap1, fname=scott, lname=tiger, and read the config map values in a pod configmap1 using image: httpd:2.4-alpine
### Note 

<details><summary>show</summary>
<p>

```bash
k create cm configmap1 --from-literal=fname=scott --from-literal=lname=tiger

Create pod using imperative way and then edit the file 
 k run configmap1 --image=httpd:2.4-alpine $dr > 1.yaml
 
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: configmap1
  name: configmap1
spec:
  containers:
  - image: httpd:2.4-alpine
    name: configmap1
    envFrom:              #add
    - configMapRef:       #add
        name: configmap1  #add
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

Test:
k exec configmap1 -it -- env | grep name
```
</p>
</details>


## Create pod configmap2 and mount the same CM into the pod2 as a volume
### Note 

<details><summary>show</summary>
<p>

```bash
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: configmap2
  name: configmap2
spec:
  volumes: 
  - name: config-volume
    configMap:
       name: configmap1
  containers:
  - image: httpd:2.4-alpine
    name: configmap2
    volumeMounts:
    - name: config-volume
      mountPath: /tmp/config
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

Test: 
k exec configmap2 -it -- cat /tmp/config/fname
```
</p>
</details>


## Create pod configmap3 and read the fname name as FNAME in the POD3
### Note 

<details><summary>show</summary>
<p>

```bash
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: configmap3
  name: configmap3
spec:
  containers:
  - image: httpd:2.4-alpine
    name: configmap3
    env:
    - name: FNAME
      valueFrom:
       configMapKeyRef:
        name: configmap1
        key: fname
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

k exec configmap3 -it -- env | grep FNAME
```
</p>
</details>

# Custom namespace and deployment in the namespace, scheduling on the master node
## Create a namespace "development" and then create deployment,nginx-deploy, using image:nginx to run on the master in the namespace development
### Note 

<details><summary>show</summary>
<p>

```bash
k create ns development
--now switch to development using alias "sc"

k describe node k8s-head | grep -i taint

k create deploy nginx-deploy --image=nginx $dr > 1.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: nginx-deploy
  name: nginx-deploy
  namespace: development
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-deploy
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: nginx-deploy
    spec:
      nodeSelector: 
        kubernetes.io/hostname: k8s-head
      tolerations:
      - key: node-role.kubernetes.io/master
        operator: Exists
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}

```
</p>
</details>

# Secrets...
## In the development namespace, create a secret called secret1 user=user1 and pass=1234
### Note 

<details><summary>show</summary>
<p>

```bash
Use the alias sc to switch to development namespace
k create secret generic secret1 --from-literal=user=user1 --from-literal=pass=1234
```
</p>
</details>


## In the development namespace, create pod secret1 (image: nginx) and mount secret1 as volume
### Note 

<details><summary>show</summary>
<p>

```bash
k run secret1 --image=nginx $dr > 1.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: secret1
  name: secret1
spec:
  volumes:
  - name: secret-vol
    secret:
      secretName: secret1
  containers:
  - image: nginx
    name: secret1
    volumeMounts:
    - name: secret-vol
      mountPath: /tmp/secret
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

To test:
k exec secret1 -it -- cat /tmp/secret/pass
```
</p>
</details>


## In the development namespace, create pod secret2 (image: nginx) and read user as USER from secret1
### Note 

<details><summary>show</summary>
<p>

```bash
k run secret2 --image=nginx $dr > 1.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: secret2
  name: secret2
spec:
  containers:
  - image: nginx
    name: secret2
    env:
    - name: USER
      valueFrom:
        secretKeyRef:
          key: user
          name: secret1
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

k exec secret2 -it -- env | grep USER
```
</p>
</details>


## In the development namespace, create pod secret3 (image: nginx) and read both the values from secret1, user and pass
### Note 

<details><summary>show</summary>
<p>

```bash
k run secret3 --image=nginx $dr > 1.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: secret3
  name: secret3
spec:
  containers:
  - image: nginx
    name: secret3
    envFrom:
    - secretRef:
        name: secret1
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

k exec secret3 -it -- env | grep user
k exec secret3 -it -- env | grep pass
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



# **NSLOOKUP**
## In the development namespace, create a POD nslookup-nginx, nginx image and service, nslookup-nginx, and nslookup both the pod and service
### Note 

<details><summary>show</summary>
<p>

```bash
Create the POD and Service
k run nslookup-nginx --image=nginx --expose --port=80

Now, create a busybox pod, using image busybox:1.28

k run bb --image=busybox:1.28 --command -- /bin/sh -c "sleep 3600"

Now, get into the POD
k exec bb -it -- /bin/sh

Note that since the svc is in a different namespace, you can either nslookup via service name or if calling from a different namespace, make sure to use the fqdn but with the right namespace

nslookup nslookup-nginx
or
nslookup nslookup-nginx.development.svc.cluster.local
 
## For POD Lookups, substitute the "." (period) in PODs IP address with "-", see below.  Make sure the right namespace is being referred and reference to "pod" as well.  The POD I created has an ip address: 10.46.0.6

nslookup 10-46-0-6.development.pod.cluster.local
```
</p>
</details>




# POD Anti-Affinity
## In the development namespace, create a deployment, nginx-anti-pod-affinity-d, image: nginx, with 3 replicas, and ensure that the POD is created on different nodes, as in the replicas of POD should not run on the same node
### Note 

<details><summary>show</summary>
<p>

```bash
Sk create deploy nginx-anti-pod-affinity-d --image=nginx $dr > 1.yaml

Edit the defintion as shown below to add the podAntiAffinity

apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: nginx-anti-pod-affinity-d
  name: nginx-anti-pod-affinity-d
  namespace: development
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-anti-pod-affinity-d
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: nginx-anti-pod-affinity-d
    spec:
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - nginx-anti-pod-affinity-d
            topologyKey: "kubernetes.io/hostname"
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}
```
</p>
</details>




# Node Affinity
## Create a POD, nginx-node-affinity-pod, image: nginx and schedule it on node k8s-node-1 using nodeAffinity
### Note 

<details><summary>show</summary>
<p>

```bash
Either you can create a new label or use existing labels on the node.  I prefer to use the existing label, see below

k describe node k8s-node-2 | grep -i label -A 5

Plan to use - kubernetes.io/hostname=k8s-node-2

apiVersion: v1
kind: Pod
metadata:
  name: nginx-node-affinity-pod
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/hostname
            operator: In
            values:
            - k8s-node-2
  containers:
  - name: nginx
    image: nginx
```
</p>
</details>




# Co-Locating PODS on the same node
## In the development namespace, create a deployment, partner-portal using image: nginx, container port running on 80, labels: tier=frontend; app=partner-portal, with 3 replicas. Add a redis deployment, partner-portal-cache, image: redis, replicas: 3 and make sure that each redis container is co-located with the nginx container
### Note 

<details><summary>show</summary>
<p>

```bash
Step1: create the parter-portal deployment with label: app: partner-portal 

apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: partner-portal
    tier: frontend
  name: partner-portal
spec:
  replicas: 3
  selector:
    matchLabels:
      app: partner-portal
      tier: frontend
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: partner-portal
        tier: frontend
    spec:
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - partner-portal
            topologyKey: "kubernetes.io/hostname"
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}

Step2: Create the partner-portal-cache deployment with redis

apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: partner-portal-cache
  name: partner-portal-cache
spec:
  replicas: 3
  selector:
    matchLabels:
      app: partner-portal-cache
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: partner-portal-cache
    spec:
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - partner-portal-cache
            topologyKey: "kubernetes.io/hostname"
        podAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - partner-portal
            topologyKey: "kubernetes.io/hostname" 
      containers:
      - image: redis
        name: redis
        resources: {}
status: {}
```
</p>
</details>




# Multi Container POD with an init container
## In the development namespace, create a multi-container POD with an init-container. Mount a volume, name: workdir, to all containers that lasts for the life of the container. For the initContainer, call it initc, image: busybox, mount a volume as /work-dir that creates "hello World" index.html. For comtainer c1, use image: busybox, sleeps 1d. For container c2, use image as nginx, mount path /usr/share/nginx/html, and check for index.html as part of its readiness after a delay of 10 seconds and check port:80 and path: / as part of its liveness probe; for liveness, check after a delay of 20 seconds and continue to check at 30 seconds interval
### Note 

<details><summary>show</summary>
<p>

```bash
k run mult-container-init-pod --image=busybox $dr --command -- /bin/sh -c "sleep 1d" > 1.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: mult-container-init-pod
  name: mult-container-init-pod
spec:
  volumes:
  - name: work-dir
    emptyDir: {}
  initContainers:
  - command:
    - /bin/sh
    - -c
    - echo HelloWorld > /work-dir/index.html
    image: busybox
    name: initc
    volumeMounts:
    - name: work-dir
      mountPath: /work-dir
  containers:
  - command:
    - /bin/sh
    - -c
    - sleep 1d
    image: busybox
    name: c1      
    resources: {}
  - name: c2
    image: nginx
    volumeMounts:
    - name: work-dir
      mountPath: /usr/share/nginx/html
    readinessProbe:
      exec:
        command:
        - ls
        - /usr/share/nginx/html/index.html
      initialDelaySeconds: 10
    livenessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 20
      periodSeconds: 30
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```
</p>
</details>




# Jobs and Cronjobs
## Jobs, create a job that displays "Hello Job"
### Note 

<details><summary>show</summary>
<p>

```bash

k create job job1 --image=bash -- /bin/sh -c "echo Hello Job"

k get jobs

k logs job1-676f8

apiVersion: batch/v1
kind: Job
metadata:
  name: helloworld
spec:
  template:
    spec:
      containers:
      - name: busybox
        image: busybox
        command: ["echo", "Hello Kubernetes!!!"]
      restartPolicy: Never
```
</p>
</details>


## Cronjobs, create a cronjob using image: bash that runs every minute
### Note 

<details><summary>show</summary>
<p>

```bash

k create cj cronjob1 --image=bash --schedule="*/1 * * * *" -- /bin/sh -c "echo Hello Cronjob"

k get cj

kgp

k logs cronjob1-1601412960-rz9hq
 
```
</p>
</details>

## Cronjobs, create a JOB from the CRONJOB, and then delete both the job and the cronjob
### Note 

<details><summary>show</summary>
<p>

```bash

k create job -h | grep -i '#' -A 2

k create job test-job --from=cronjob/cronjob1

kgp

k logs cronjob1-1601412960-rz9hq

k delete cronjob cronjob1
k delete job test-job
 
```
</p>
</details>



# Volumes
## empty-dir
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>


# Volumes
## hostpath
### Note 

<details><summary>show</summary>
<p>

```bash
Solution here.....
```
</p>
</details>



# Volumes
## PV and PVCs - Create pv and pvc's for nginx 
### Note 

<details><summary>show</summary>
<p>

```bash
name: nginx-pv-volume
storageclass: local
size 1Gi
hostPath: /mnt/data/nginx
accessModes: ReadWriteMany

pvc name: nginx-pv-claim

<details><summary>show</summary>
<p>

```bash
apiVersion: v1
kind: PersistentVolume
metadata:
  name: nginx-pv-volume
  labels:
    type: local
spec:
  storageClassName: local
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/mnt/data/nginx"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nginx-pv-claim
spec:
  storageClassName: local
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi

```
</p>
</details>




# Network Policy
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




Create a ClusterIP service that exposes port 80 for the nginx pod
Create a busybox pod and hit the ClusterIP service
Create a nodePort service for the nginx pod

Create a pod with main container busybox and which executes "while true; do echo 'Hi I am busybox' >> /var/log/index.html; sleep 5; done" and with sidecar container with nginx image which exposes on port 80. Use emptyDir Volume and mount this volume on path /var/log for busybox and on path /usr/share/nginx/html for nginx container. Verify both containers are running.





At the end:
Create a deployment of nginx with 20 replicas, use image as "nginx:1.14.2"
Update the strategy to be rolling update: maxSurge of 6, max unavaiable as 3
Create an environment variable name: company; value: hitachi-vantara and use it in the deployment
Create a config map, config1, with var1=val1, var2=val2 - use it in the deployment
Create a config map, config2, with var3=val3, and make it available to the deployment as env variable VARIABLE3
Create a config map, config3, with var4=val4, var5=val5 and mount the variables as a volume, mountPath - /etc/config, in the deployment
Create a secret, secret1, with var1=val1, var2=val2 - use it in the deployment
Create a secret, secret2, with var3=val3, and make it available to the deployment as env variable VARIABLE3
Create a secret, secret3, with var4=val4, var5=val5 and mount the variables as a volume, mountPath - /etc/secret, in the deployment
Create an emptyDir volume and use in deployment
Create a volume with hostPath as "/usr/share/nginx/html" and use in deployment

There is a new version of the image, update your deployment to "nginx:1.15.10"

Its 3am in the morning, and you have been called to deploy "nginx:1.15.66"

