

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




# Integrating Maven with Nexus
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


# Remote repo, proxy repo and group repo
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
To share the jar files with different teams, create remote repo
In the UI, create repo
Then Browse, and upload component

Now go to maven server, in pom.xml add remote repo

Concept of Proxy-Repo which proxies the central repo. Central repo has the dependencies - why - if central repo has virus (Assuming the central repo is in the cloud), proxy server which is local to the organization has AV software
- create proxy-repo first
and then go to Maven pom.xml
Remove remote repo
Add proxy repo

Now execute
mvn clean package 
- since its not in proxy repo, it will fetch first from central repo

Just a note: maven central repo is being maintained by maven community, so that indicates the central repo is public

Concept of Group Repo
IF you have multiple remote repos and you want to download from multpile repos, create a group that incudes
- multiple remote repos
- proxy repo

Now use the group repo in the maven pom.xml configuration

mvn clean package
- the output will show downloading from group repo, but internally downloading from group repos

CONCEPT:
For each project, you will have a release and snapshot repo
For all projects, you will have remote, central, proxy, group 

```
</p>
</details>




# Adminstration activities
## Creating users, etc
### Note 

<details><summary>show</summary>
<p>

```bash

Activity1:
To create a user in Nexus 
 - Gear icon (settings) - Security - Users

Roles: nx-admin and nx-anonymous are 2 roles

You can also integrate with LDAP/AD

Activity2: Cleanup policy - to remove content from repos

Activity3: API
Activity4: Configure email server



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


