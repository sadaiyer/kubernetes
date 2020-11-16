

# Sonatype Nexus
## Artifact repo
### Note 

<details><summary>show</summary>
<p>

```bash
Nexus is an Open-Source software (OSS) Artifactory repo manager. There is a PRO/Enterprise edition
Used to store build artifacts
Java - jar, war, ear
Docker - docker images
NodeJs - npm packages

Alternatively to Nexus, you can use jFrog artifactory

Nexus needs Java 1.8 (also called Java8)
Version is 3.x, current location is 3.28.1
Need 1GB RAM, t2.medium

After install
/opt/nexus/etc/nexus.properties
/opt/nexus/bin/nexus.rc. <<-- run_as_user="nexus"
/opt/nexus/bin/nexus start

http://ip:8081/nexus --for 2.x

Nexus and jFrog artifactory default port number: 8081
http://ip:8081/ --for 3.x
admin
Password in cat /opt/sonatype-work/nexus2/admin.password


To change context path and port
/opt/nexus/etc/nexus.properties
application-port:9999
nexus-context-path=sadaiyer

Restart nexus and then access
http://ip:9999/sadaiyer


```
</p>
</details>





# Nexus
## Create repository
### Note 

<details><summary>show</summary>
<p>

```bash
Three types of repo:
Group
Hosted
Proxy

Category: snapshot, release, and one more

For each project, create a release and snapshot


```
</p>
</details>




# Integrating Maven with Nexuss
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
In pom.xml, we configured in properties tag, the sonarqube details
Similarly, do the same for nexus

In the Maven server, in pom.xml

<distributionManagement>
 <repository> 
  <id>nexus</nexus>
  <name>Nexus release repo</name?
  <url>http://ip/sadaiyer/repository/mycompany-release/ </url>
 </repository> 
  
 <snapshotRepository> 
  <id>nexus</nexus>
  <name>Nexus snapshot repo</name?
  <url>http://ip/sadaiyer/repository/mycompany-snapshot/ </url>
 </snapshotRepository> 
</distributionManagement?>

$MVN_HOME/conf
Nexus credentials are stored in settings.xml
In the conf directory
<servers>
  <server>
     --configure nexus credentials here...
    <id>nexus</nexus> --keep same aa pom.xml
    <username>admin<username>
    <password>password_you_set<password>
  </server>
</servers>

To upload to local repo, using install
To upload to remote repo, use deploy

Go to the path where pom.xml exists on the maven server
  mvn clean deploy

This will deploy to nexus server now

Go to nexus now - click on Browses icon - mycompany-snapshot
/com/mss/maven-web-application-0.01-SNAPSHOT/date/xxx.war

Snapshot repo - used for ongoing development - so different version

For production releases, after changing version from 0-0-1-snapshot to 1.0.0, then it will deploy to production releases - mycompany-release.   The word snapshot is the key.  Assuming 1.0.0 is having issues, if you try to deploy 1.0.0 again to the release, it will error http-400 - Bad Request.

Option is to change version, but what if folks are using 1.1.0.  There is an option for the repo - "Disable Redeploy", change that to "Allow redeploy"; this will allow you to redeploy 1.0.0 again.  Settings (Gear icon) for the repo...

```
</p>
</details>


# Heading1
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
To share the jar files with different teams, create remote repo
In the UI, create repo
Then Browse, and upload component


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




# Heading1
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

```
</p>
</details>




