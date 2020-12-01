

# CI and CD
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
CI - build + test - automation 

For java, maven, ant or gradle
For .net, build tool is MSBuild
For Java, test - use jUnit
For test, Selenium

Selenium is a tool that remote-controls a browser. You can use it to simulate a user interacting with a web site. JUnit is a framework for writing Java unit tests. ... If you need to write tests for a web site, you might use JUnit tests that call Selenium APIs.

C Delivery - dont deploy directly to production - manual approval

C dePloyment - deploy to production

JaCoCo plug-in - is used for java code coverage

Enterprise edition CI tools - CloudBee Jenkins, Bamboo

Jenkins open source is community edition

Repos are in /etc/yum.repos.d
So first install via 
wget -o /etc/yum.repos.d/jenkins  https://.....


```
</p>
</details>



# Integrating Jenkins
## via pom.xml
### Note 

<details><summary>show</summary>
<p>

```bash

Install maven, git on jenkins server
When you do that in /var/lib/jenkins (jenkins home dire)

/var/lib/jenkins
/var/lib/jenkins/workspace/<app-name>/target/*.war --sub-dir where war file is


Integrating Sonarqube with Jenkins

Ensure that in pom.xml(in Git), you have the sonarqube details
under <properties> 
provide sonarQube url, username and password

In jenkins, build step
mvn
clean package sonar:sonar

Integrating Nexus with Jenkins
Now create a snapshot repo in Jenkins
In pom.xml (in Git), provide repo details

In settings.xml, configure nexus credentials


Since you installed maven on jenkins server, you have to specify the nexus credential in the settings.xml...which settings.xml
When you do that in /var/lib/jenkins (jenkins home dire)- under tools directory, maven will be installed, so
/var/lib/jenkins/mav*/conf/settings.xml

Search for servers tag

<server>
  <id> </id>
  <username> </username>
  <password> </password>
</server>


Integrating TomCat to deploy with Jenkins

Plugin: Deploy to Container
is used to deploy to Tomcat (misleading name), same plugin works for jboss and wildfly

Now in Post-Build actions, use Deploy war/ear to container
**/<warfilename>.  each war signifies a directory corresponding to maven home 
/var/lib/jenkins/mav*/<dir>/*.war

Create TomCat credentials too
TomCat URL


How can you trigger
1. Poll SCM
2. Build Periodically
3. Github web hook


      


```
</p>
</details>




# Additional Jenkins functionality
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Configure email functionality
Discard old build

Jenkins job
- Configure 
Check Discard old builds
Option for "Days to keep builds"
Max # of builds to keep <-- both options are required

Under Advanced
Max # of builds to keep with Artifacts <-- both options are required


Build Environment
Option to "Delete workspace before build starts"
If source code exists in Jenkins, will pull only updated code from GitHub - with the above option set, it will delete the workspace and do a full fresh clone from Github


Option to Disable Project
Why: if you dont want to trigger Jenkins build during maintainence of supporting servers - sonar, apache tc, etc

JaCoCo Plugin for java code coverage
Manage Jenkins - plugins - install JaCoCo plug in

Under Post Build actions 
Add Post-build action
--Record JaCoCo coverage

If code coverage < 80%, mark build as failure
Enable "Change build status according the thresholds"
and
Specify the 80% option



SMTP with Jenkins
1  need SMTP server details. = smtp.gmail.com
2. email id: iyersada@gmail.com/***


```
</p>
</details>


# Jenkins Directory structure
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
jenkins home is /var/lib/jenkins
  /jobs   <<-- all jobs sub-dir here
    jobname
      nextbuildnumber <<- text file
      build
          log
  /workspace
   - <jobName> source code that Jenkins pulls from Github
   - <jobName>@tmp
  
  /users
  
  /plugins
  
  /nodes - default node is master (since it can have slaves)
 
/var/logs/jenkins <<--jenkins.log 
   


```
</p>
</details>



# Plugins
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
Maven Plugin
When you go to new item, Maven is not there. Freestyle works for all - maven, python, etc
Not available by default, so install "maven integration" plugin first

Maven project - for java projects where maven is the build tool
So, create new project, choose maven project

Under Build trigger - new option - "Build after other projects are built"

Safe Restart Plugin
To restart Jenkins
http://<url>:8080/restart     - will stop all running jobs and restart
http://<url>:8080/safeRestart - will wait until all jobs are completed
Need SafeRestart plugin to be installed

Next Build Number Plugin
To enable build start number
To update specific file - NextBuildNumber in jobs directory
Go to job level and you will see an option "Set Next Build Number"


JaCoCo plugin - already done

SSH Agent plugin
Will discuss when we create a job using pipeline project

Email Extension plugin
Add Post Builds - Editable email (gets installed by default)

SonarQube Scanner
If you want to integrate SonarQube server with Jenkins, need SonarQube scanner plugin
For Java-maven, we have seen that we keep sonar qube server details in pom.xml
For nodeJS, .net language - need to integrate via the Sonarqube scanner plugin

Audit Trail Plugin
Configure System - you will see Audit Trail section, after you install Audit Trail plugin
Add Logger
Log File location details

Schedule Build
Like cron

Job Config History plugin

Blue Ocean plugin

Publish over ssh
- to copy file from server1 to server2, we use scp where we provide username and password; you can instead use this plugin

Thin backup
Install this plugin for Jenkins backup

Build name and description Setter
To prepend env to build number
Go to job - click on configure - find "Set Build name" in Build environment, add "dev_" in front here.


Convert to Pipeline plugin
So far, created jobs using freestyle, later we will use pipeline.  To convert freestyle to pipeline, we will use this plugin

Advanced Tab
To install external plugins, you need to first download external plugins and then install



```
</p>
</details>




# Pipeline Project Type
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

2 ways

1. Scripted way
node  <<--if you dont specify node name, it will run on master, will be useful when running on slave nodes
OR
node('master')
{

def mavenHome=tool name: "maven3.6.3". --this is the name we provided when we configured maven in jenkins - manage jenknis - global tools configuration

stage('CheckoutCode')
  {
  }

stage('buildCode')
  {
    sh "${mavenHome}/bin/mvn clean package"  --for windows, use bat instead.  To ensure we get mvn path, define variable using def
  }
stage('ExecuteSQReport')
  {
    sh "${mavenHome}/bin/mvn  sonar:sonar"
  }

stage('UploadArtifactToNexus')
  {
    sh "${mavenHome}/bin/mvn  deploy"
  }


stage('DeployArtifactToTomcatServer')
    sshagent ( via snippet generator )    --install plugin "ssh agent" to enable secure copy between jenkins server and Tomcat server, using plugin - create credentials using private key (pem file)
      {
       scp -o StrictHostKeyChecking=no target/*.war ec2-user@<ip>:/tomcat_path/webapps/ --tomcat is in /opt/tomcat*
      }
    
  }
  
}


2. Declarative way

pipeline
{
  @Library --import groovy script existing libraries
  
  agent any --will run in master node, comment to specify node 
  OR
  agent
  {
    label 'NodeName/LabelName'
  }
  tools 
  {
   maven 'maven 3.6.3'
  }
  stages
  {
    stage ('CheckOutCode')
    {
      steps { git command from snippet generator }
    }
    stage ('Build')
    {
      steps {
        sh "mvn clean package"
      }
    }
    
    stage ('ExecuteSonar')
    {
      steps {
        sh "mvn sonar:sonar"
      }
    }
    
    stage ('UploaArtifactsIntoNexus')
    {
      steps {
        sh "mvn deploy"
      }
    }
 
    stage ('DeployAppIntoTomcat')
    {
      steps {
        ssh agent command here
        sh "scp command here"
      }
    }
 
    post    --to send email
    {
      always or success or failure
      {
       Here will write code for sending email using snippet generator
      }
    
    }
 
  }
  
 
}

```
</p>
</details>



# Master-Slave in Jenkins
## Architecture
### Note 

<details><summary>show</summary>
<p>

```bash

Master--> slave1
     |
      --> slave2
      
Why MS arch - to improve performance, and spread load amongst slaves

In master - install java, git, maven
In slave  - install java, git can be differnt OS from master, such as windows
For maven, see note below: *Since maven is installed on the master via global tool configuration, it enables maves on slave too

Add new node:
Go to Manage Jenkins - manage nodes and clouds 
This is where you configure your slaves
Name: node1
Remote home dir: /home/ec2-user/node1 <--create this dir

Launch method: Launch agents via ssh
Credentials: when adding credentials, username: ec2-user;  add pem key
Host key verification strategy: manualy trusted key verification strategy

After successful connect, there will be a directory and file created in /home/ec2-user/node1

remoting <--directory
remoting.jar  <--file


Now, configure job, or use an existing job
Select the job - click configure
Search for "Restrict where this project can be run" - Select the checkbox
Provide the label expression


*Since maven is installed on the master via global tool configuration, it enables maves on slave too
/home/ec2-user/node1/workspace
/home/ec2-user/node1/tools

For a pipeline project, the "Restrict where this project can be run" is not available, so have to configure it...where? In jenkinsfile

In jenkinsfile - replace
node
{
}

with 

node('node1') <--can be nodename or label 
{
}

If you run 2 jobs on the same node, it will queue the second job since we have # of Executors as 1

Click on node1 - click on configure - change # of executors from 1 to new number (obviously depends on #cpu and memory on the server)


```
</p>
</details>



# Jenkins
## Backup
### Note 

<details><summary>show</summary>
<p>

```bash
Missed because of thankgiving evening

```
</p>
</details>


# Heading1
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

```
</p>
</details>



