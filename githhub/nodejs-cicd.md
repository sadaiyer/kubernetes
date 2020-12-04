
# NodeJs CICD app
## Jenkins for deploying nodeJS app
### Note 

<details><summary>show</summary>
<p>

```bash
NodeJS App: in mithun tech github bases nodejs-app-mss

npm install   to build
npm test
npm run sonar
nmp publish   to deploy to artifactory repository

Jenkins
New Item - nodeJS-pipeline
pipeline projecct
node
{
  stage('CheckoutCode')
  {
    --use pipeline syntax to generate code for checkout
  }
  stage('buildcode')
  {
    sh "npm install"    ---install nodeJs in the linux server where Jenkins is running
    --if you need a specific version of nodejs, you can
    --install the nodejs plug in first
    --configure in global tools the specific version e.g. nodejs15.3.0, see below how to configure and use
  }
  stage('Build')
  {
    nodeJs(nodeJSInstallationName: 'nodejs15.3.0')
      {
        sh "npm install"
      }
  }


  stage('ExecuteSonarQubeReport')
  {
    nodeJs(nodeJSInstallationName: 'nodejs15.3.0')
      {
        sh "npm run sonar"
        --to configure jenkins to talk to sonar, create a file
        --file name sonar-project.js
      }
  }
  
  stage('UploadArtifactIntoNexus')
  {
    nodeJs(nodeJSInstallationName: 'nodejs15.3.0')
      {
        sh "npm publish"
        --to configure jenkins to talk to nexus, 
        --update nexus repo details in package.json
        --create hosted repo first, copy url
        --nexus credentials configured in .npmrc
        --echo -n "admin:passw0rd" | openssl base64
        --it will download in /var/lib/jekins/workspace/nodejs-pipeline
        --a directory called node_modules with all the dependencies
      }
  }
  
  stage('RunNodeJSApp')
  {
   sh "chmod +x ./scripts/runApp.sh"
   sh "./scripts/runApp.sh"
  }
  

}

```
</p>
</details>

