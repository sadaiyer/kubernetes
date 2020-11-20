

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



# Heading1
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

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


