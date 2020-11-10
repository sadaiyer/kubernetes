# All about Build Tools
## Build packages or artifacts
### Note 

<details><summary>show</summary>
<p>

```bash
For a specific source code, you need to create a package or build artifact, and you need a build tool for that
For Java, they are ANT, MAVEN or GRADLE
For .net, it is MS Build or Nant
For Java Script, it is Gulp or Grunt
For Python, py builder
For Ruby, its Rake

For Java, you can create
1. stand-alone applications
Contains only java code - therefore need to create JAR package - java archive

2. web applications
Will consist of java code + web content (html, css, js, images)
Here, we will create a WAR file - web archive

3. enterprise applications
Will consist of n number of modules, think, eCommerce site
java code + web content
In this case, its an EAR file, containing n number of WAR files, with minimum 1 WAR file

Apache developed Maven, hence called Apache Maven (Open Source)

```
</p>
</details>



# Package structure for MAVEN
## settings.xml config file
### Note 

<details><summary>show</summary>
<p>

```bash
Download maven binary from apache site
Unzip or untar and you will see
/bin   <<--mvn file is here
/conf  <<--all the config files, settings.xml is important file to use
/lib   <<--all the libraries are here, jar files
/boot exists as well

Before you install maven, install java
maven 3.6.3 is the latest version, and need the right java version, java8 or called Java 1.8

JDK - java dev kit
JRE - java runtime env

Maven needs JDK, since you are developing (As compared to just the JRE)

java -version
mvn -version

Default filename for 
maven build is pom.xml (can give custom name)
ant         is build.xml
gradle      is build.gradle

POM - stands for project object model
POM has a section for
- project details
- dependencies such as junit, log4j, etc

To run, 
mvn package --what package
it will look a the project details and see if WAR or JAR is specified and create

maven repos:  when, when you execute your mvn package command. It will then get the dependencies from the repos
1. maven local repo - folder in your laptop
  ~/.m2/repository, gets created when you run the mvn package commmand the first time
  can change default location to custom location, make change in settings.xml 
    <localRepository>custom path here</localRepository>

2. maven central repo
  maintained by maven community, all dependencies (libraries) here
  So need internet connectivity
  If a package is not found in local repo, it will fetch from central repo


3. remote repo
   private remote repo
   configure remote repo in pom.xml file (will do when we learn Nexus)


```
</p>
</details>



# Maven Life-Cycle
## Maven Goals
### Note 

<details><summary>show</summary>
<p>

```bash
LC            Goals   Description
--            -----   ---------------------------------------------------
Clean         clean   Will delete the previous build file

Site          site    Will generate the documents for the source code
                      not used now-a-days, instead using swagger
                      
Default       validate  Will validate project structure and resource files
              compile   
              test      Will run jUnit test cases (c - cUnit, .net - .nUnit, c++ - CPPUnit )
              package   Create package - ear, war or jar
              install   Will store the package/build artifact in local repo
              deploy    Will store in remote repo
mvn test

mvn package

mvn clean package   --can specify multple goals at the same time

mvn clean package -DskipTests
or
mvn clean package -Dmaven.test.skiptest

In a Enterprise app, there are multiple modules and it will take time to build, use

mvn package -pl <moduleName> <moduleName>

java -jar filename

for WAR and EAR, need an web server like TomCat

```
</p>
</details>



# Running WAR and EAR files
## Need an application server
### Note 

<details><summary>show</summary>
<p>

```bash

1. Apache Tomcat - open source, java based web application server --supports WAR files

2. jBoss, renamed to Wildfly --RedHat --aquired by IBM --supports WAR & EAR files
-from 1.x to 7.x it was called jBoss
-8.x onwards, its called WildFly

3. Websphere App Server - IBM

4. BEA Weblogic Server  - now, Oracle

```
</p>
</details>




# Tomcat directory structure
## /opt/apache-tomcat-9.0.39
### Note 

<details><summary>show</summary>
<p>

```bash
Tomcat directory Structure
/bin    
  - startup.sh
  - shutdown.sh 
  - catalina.sh start/stop
  - version.sh

/conf
  - server.xml
  - tomcat-users.xml

/lib

/logs
  - catalina.out
  - manager.log
  - hostmanager.log
  - localhost.log

/webapps
  - apps that you deploy, the WAR files will be here

/work
  - by default its empty, files that run show up here
  
/temp

```
</p>
</details>





# Tomcat Installation
## Need Java JDK 1.8
### cd /Users/siyer/Downloads/K8S/second-vagrant-vm: 10.0.0.51:8080 

<details><summary>show</summary>
<p>

```bash
Pre-req: need java 1.8
Tomcat 9.x, need Java 1.8 for this version of Tomcat
Launch t2 micro
sudo -i
http://mithuntechnologies-devops.blogspot.com/search?q=java
To install java - http://mithuntechnologies-devops.blogspot.com/search?q=java
To install tomcat - http://mithuntechnologies-devops.blogspot.com/search?q=tomcat



To deploy, use the admin UI - http://10.0.0.51:8080
username: tomcat/tomcat

manager-app and server status via the "manager-gui" role
host-manager accessed via the "admin-gui" role

cd /opt/apache-tomcat-9.0.39/conf
I added in tomcat-users.xml file in 

<role rolename="manager-gui"/>
<user username="tomcat" password="tomcat" roles="tomcat, admin-gui, manager-gui"/>


```
</p>
</details>





# Deploy applications
## WAR files in /webapps
### Using mvn build tools, we have deployed the package

<details><summary>show</summary>
<p>

```bash
10.0.0.51:/8080
username: tomcat/tomcat
deploy the WAR file using the 

http://10.0.0.51:8080/<AppContextPath>

http://10.0.0.51:8080/maven-web-application

or
copy the WAR file to /opt/apache-tomcat-9.0.39/webapps

manager-app and server status via the "manager-gui" role
host-manager accessed via the "admin-gui" role

```
</p>
</details>




# Tomcat Performance issues
## Review the tomcat PDF file provided
### Note 

<details><summary>show</summary>
<p>

```bash
Sada, please upload PDF in the github

```
</p>
</details>




# Web Servers
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
apache http server
nGinx
Oracle iPlanet
IIS
IBM HTTP Server - called IHS

WebServer used for deploying static context - html, CSS, JS, images, XML
Web Servers can be used as Load Balancing Server
HAProxy is only for load balancing, no ability to serve static content

AppServer is used for deploying backend related code such ass JAVA, e.g. WAR file 
Executes business logic


In the apache-tc server, 10.0.0.51, install apache http server, it runs as "apache" (system user) user

http://mithuntechnologies-devops.blogspot.com/search/label/HTTP%20Server

Use this instead - https://phoenixnap.com/kb/how-to-install-apache-web-server-on-ubuntu-18-04

apt-get update
apt-get install apache2

To verify, http://10.0.0.51:80

Now, go to /var/www/html and create index.html


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


