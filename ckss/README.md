# Certified Kubernetes Security Specialist
## Coming soon...Nov 2020
### Pre-Req: Need CKA certification

<details><summary>show</summary>
<p>

```bash
Start your preparations now!

In order to take the CKS exam, you must hold a current CKA certification to demonstrate you possess sufficient Kubernetes expertise. If you want to make sure you are ready for the CKS and have not already achieved the CKA, we encourage you to start today! We provide a wealth of resources to help you prepare for CKA.

The details

CKS is similar in format to CKA and will consist of a performance-based certification exam – testing competence across best practices for securing container-based applications and Kubernetes platforms during build, deployment, and runtime. 

The new certification is designed to enable cloud native professionals to demonstrate security skills to current and potential employers. The exam will test domains and competencies including:

Cluster Setup
Cluster Hardening
System Hardening
Minimize Microservice Vulnerabilities
Supply Chain Security
Monitoring, Logging, and Runtime Security
The certification is expected to be generally available before the KubeCon + CloudNativeCon North America Virtual event taking place November 17-20. 
```
</p>
</details>


# Killer.sh
## Practise
### Note 

<details><summary>show</summary>
<p>

```bash
CKS

CKS Certified Kubernetes Security Specialist
Is this certification for you, what will be asked, and how to prepare?
Kim Wuestkamp
Oct 19 · 3 min read

This article will give you an overview of the CKS, how the real exam is structured, and some tips and tricks on how to prepare.
Kubernetes Certifications
		In the CKAD you work with running clusters and create all kinds of Kubernetes resources.
		In the CKA you also have to do some deeper CKAD tasks with additionally fix broken and perform maintenance on clusters.
		The CKS extends the CKA, which is a pre-requirement to have. It considers various security configurations and best practices when it comes to cluster and application level.

Why is the CKS interesting?
The CKS is a very important certification and the knowledge it brings is requested by many companies. The current time, where Kubernetes is the platform to run container based workloads and where the importance of secure infrastructure became top priority, led to the development of the CKS.
Security will play a larger and larger part in the coming years as new laws are created which make companies responsible for security and data breaches.
What is the CKS about?
There are a few categories when it comes to Kubernetes Security in general. Let’s list these with a few possible topics:

Application Level
		NetworkPolicy
		RBAC
		Secrets
		Sandboxing
		Container Attack Surface
		…
Cluster Level
		Apiserver access
		External access of components
		Secure component communication
		Node Metadata protection
		AdmissionControllers (like enforcing certain image repositories)
		Audit Logging
		…
Host Level
		Linux Attack Surface
		Vulnerability Scanning (like using Falco)
		Malicious Processes
		…
Based on these categories you can see that administrative knowledge, which comes with the CKA, is necessary to pass the CKS.
You only work with managed Kubernetes?
Still, the CKS will be interesting for you. A good portion is about securing the administrative tasks of a cluster, but there is also a lot that can be useful if you use only managed k8s like GKE, AKS, or EKS.
Examples can be creating secure Docker containers, forcing pods to run their containers immutable, handling secrets properly, finding malicious processes, or even using a sandboxing engine like gVisor.
How to prepare?
I would suggest to create your own simple kubeadm cluster having one master and one worker node. From there on run through the various topics, configure and understand everything.

		Great Video about Security Best Practices:
Kubernetes Security Best Practices - Ian Lewis, Google

		FREE BOOK: Sysdig Kubernetes Security Guide
		FREE BOOK: Also a nice read (though based on outdated k8s version) is the Kubernetes Security book by Liz Rice
		Awesome Github repo with collective resources on how to prepare
		CKS Curriculum: study all the topics
		Killer Shell CKS Simulator: fully simulated CKS environment

How is the real CKS exam structured?
In the real CKS, you’ll have access to various k8s clusters, one for each question. So you might end up with one terminal which has a kubeconfig file with 16–20 clusters. This is great for separation because if you mess things up at least questions don’t interfere with each other.
Every cluster consists of one master and one worker node which are set up using kubeadm and run Ubuntu.
Make config backups!
If you have to alter k8s component configuration, like Apiserver config, then always make a backup. This way you can restore in case you mess things up, and you will!

Complete simulated CKS environment
Test your CKS knowledge and learn from detailed solutions in a simulated hands-on practice environment on killer.sh.
		Register for free and get 3 preview questions+solutions
		Use discount code CKSBETA to subscribe and get 20% off



```
</p>
</details>



# Read this PDF
## Kubernetes Security
### Note 

<details><summary>show</summary>
<p>

```bash
https://github.com/sadaiyer/kubernetes/blob/master/ckss/pf-kubernetes-security-guide.pdf```
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
