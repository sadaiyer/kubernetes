
# Sonarqube
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

Code Coverage: what % of code is covered by test cases - industry standard - 80%

Code Review: code developed as per standards, will use SonarQube

SQ is Free for some languages, developed using Java
Continuous Code Quality tool

SQ was prev called Sonar.
- duplicate code
- coding standards
- unit tests
- complex code
- commments
- potential bugs
- arch & design

Initially, developed for Java, but now supports 20+ languages
Support on windows, mac, linux



```
</p>
</details>




# Unit Testing framework tools
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash
java  jUnit
c     cUnit
C++   CPPUnit
JS    Jasmine

```
</p>
</details>


# SonarQube
## Architecture
### Note 

<details><summary>show</summary>
<p>

```bash

SonarQube Scanner - scans the code, and generates the report
SonarQube Server - has a compute engine, that provides report as 3 categories
1. Vulnerabilities
2. Bugs
3. Code Smells

Scanner creates the report, but Server provides the categories, and then stores into a database that is configured.  IF no external DB is configured, then it stores in internal db called H2

To access the report, internall SQ Server uses a WebSesrver

```
</p>
</details>




# SonarQube 
## Install
### Note 

<details><summary>show</summary>
<p>

```bash
Install java
Install SQ community edition
Port number: 9000
admin/admin

To change password: to to A logo on RHS top corner, click security, change password


```
</p>
</details>


# Using SonarQube
## Sub-Heading
### Note 

<details><summary>show</summary>
<p>

```bash

Lets start with a java project, we are using Maven, so we have a pom.xml file,   Add SonarQube server details in pom.xml - URL, username and password

mvn clean sonar:sonar --is the command to issue next
--sonar - first one is the plugin name
--sonar - second, is the goal name

<properties>
  <sonar.host.url>http://sonarqube_server:9000</sonar.host.url>
  <sonar.login>admin</sonar.login>
  <sonar.password>admin</sonar.password>
  
</properties>

and then execute

mvn clean sonar:sonar

Instead of using password above, instead generate token
In SonarQube server, extreme RHS, click on A for Admin
For username admin, generate Token here...
Give a name for the token and click generate

Now comment the username and password
<!--
  <sonar.login>admin</sonar.login>
  <sonar.password>admin</sonar.password>
-->
and replace with
  <sonar.login>replace with token</sonar.login>



```
</p>
</details>




# SonarQube
## Admin Activities
### Note 

<details><summary>show</summary>
<p>

```bash

Activity1:
To change from h2 database, in the SQ server
go to SonarQube home and conf directory
$SQ_HOME/conf/sonar.properties  ($SQ_HOME is what I named)

Activity2:
Token validity is until you delete

Activity3:
Projects tab - all projects you ran sonar qube
Issues - all issues related to the projects
Rules - All languages and ruleset for the language

Quality Profiles - You need to create Quality Profile instead of default profiles, these are for custom rules and severity - critical, major, minor, etc

You can then assign the quality profile to ALL Java Projects in Quality Profile tab

To assign quality profile to specific java project, click on 
Project - select project - Administration - quality profile

Quality Gates - When a project is marked as Passed or Failed, that is derived from the quality gate
Default quality gate provided is Sonar Way (there is a default quality profile Sonar Way too)

e.g. if code coverage is < 80% you want to fail the quality
So create a Quality Gate - myQualityGate
and then add a condition - the condition will be, in this case, code coverage condition
The code coverage condition is "Coverage"

Now assign this Quality Gate to the project
Project - Admin - QG - myQualityGate

Final Tab, Administration (see this when you login as administrator)
Sub Tabs
- Configuration
- Security - Users; Groups; Permissions
  By default users are assigned to "sonar-users" group
  and not assigned to the "sonar-administrators" group
- Projects
- Systems 
  - external database info here, by default H2 db details
- Marketplace
  - To add PL/SQL or ABAP, you need Developer Edition
  - Enterprise - Apex, or Cobol, etc
  - Data Center Edition
 - In Marketplace,  you can also install and remove Plugins

SonarCloud.io is the SaaS version for SonarQube

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




