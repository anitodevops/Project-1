# Steps for Build Phase

## Step 3: Bash Scripting

### Create build.sh to build & push docker image  to DockerHub registry 

-	Create a repo to test build.sh image push to DockerHub registry 
    - Repo_Name Repo **app-image** 
    - visibility - public

-	Provide execute Permissions to build.sh

    `chmod +x build.sh`

-	Use command to execute 

    `./build.sh`

  ![script-output](https://github.com/anitodevops/Project-1/blob/dev/Images/Exec%20of%20build%20script.png)
  

  ![dockerhub](https://github.com/anitodevops/Project-1/blob/dev/Images/Image%20Push%20to%20Registry%20via%20Build%20script.png)


### Create deploy.sh with below logic

  - Pass App-Server’s Public IP as argument.
  - Transfer the docker-compose file  using SCP & use the private key to connect to the AppServer.
  - Install docker & docker-compose packages.
  - Pull the image from DockerHub registry and deploy the image to Server using docker compose.

  -	Provide execute permissions to deploy.sh 

    `chmod +x deploy.sh`

  -	Run to test

    `./deploy.sh <public-Ip>`

  -	Perform browser verification : http://<public-IP>:80

    ![website](https://github.com/anitodevops/Project-1/blob/dev/Images/deploy%20scrpt%20Output%20.png)
