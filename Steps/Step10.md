# Steps for Build Phase

## Step 6: Jenkins Pipeline Setup

### Access jenkins 

Jenkins URL - **http://localworkspaceIP:8080**

![login](https://github.com/anitodevops/Project-1/blob/dev/Images/Jenkins%20setupLogin.png)

### Get the password to login to jenkins.

```sudo cat <path-/var/../>```

### Choose Install default plugins

Jenkins by default installs few packages to perfeom basic tasks.

### Update Username & Credentials 

![orgLogin](https://github.com/anitodevops/Project-1/blob/dev/Images/Jenkins%20Login.png)

### Install Additional Plugins – Docker, Docker Compose, Pipeline Stage View, SSH-Agent. 

- Go to Jenkins->Manage jenkins -> Plugins ->Available Plugins -> Search Plugins & Click Install.

![plugins](https://github.com/anitodevops/Project-1/blob/dev/Images/Jenkins%20Plugins.png)

- Enable restart after installing plugins as a best practice.

### Configure Jenkins Global credentials with DockerHub, GitHub, App-Server private key.

- Go to Jenkins -> Manage jenkins ->Credentials -> System -> Global credentials -> add credentials 

- Add Choose Username with password for Docker, GitHub & SSH username with Private Key for SSH Credentials

- Enter Name, ID, Username, password/ Paste Private key directly & add a description

![credentials](https://github.com/anitodevops/Project-1/blob/dev/Images/Jenkins%20Credentials.png)

Note: ID will later be used in the Jenkinsfile to invoke the credentials inside the pipeline.

### Create a Multibranch pipeline with the below logic

- If change is pushed to dev branch → Build & push to react-app-dev (public).
- If dev merges to master → Build & push to react-app-prod (private).
  
#### Steps:

##### Go to Jenkins -> Create new item -> choose -> Enter Pipeline name -> choose Multibranch Pipeline -> OK

  ![multibranch](https://github.com/anitodevops/Project-1/blob/dev/Images/Multi-Branch%20Pipeline.png)

##### In General : Enter Display Name , Description , Enable webhook trigger

  ![config](https://github.com/anitodevops/Project-1/blob/dev/Images/Jenkins%20Configuration%20.png)

##### In Branch Source : choose GitHub -> choose github Credentials -> enter github Repo HTTPS URL -, click validate,  for Discover branches – choose All Branches

  ![branchSource](https://github.com/anitodevops/Project-1/blob/dev/Images/Jenkins%20Branch%20Source.png)

##### In Build Configuration :  choose PipelineScriptfromSCM -> mode: by Jenkinsfile , script path: Jenkinsfile (filename as in github)

  ![BuildStep](https://github.com/anitodevops/Project-1/blob/dev/Images/Jenkins%20Build%20steps%20.png)

  
