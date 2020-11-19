

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


