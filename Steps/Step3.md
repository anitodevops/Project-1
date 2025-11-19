# Steps for Pre-Build Phase

## Step 3: Setup DockerHub Repositories

### Login to DockerHub
[DockerHub SignIn](https://hub.docker.com) 

![loginsucces](https://github.com/anitodevops/Project-1/blob/dev/Images/Dockerhub%20login.png)

### Generate DockerHub Access Token

##### Go to DockerHub -> Account settings -> Personal Access Token -> click Generate New Token 
  
    - Enter Token description

    - Choose Expiration Date – 30/60/90 Days
    
    - Choose Access Permissions (Read, Write) 
    
    - Click Generate

### Create two DockerHub repositories 

- react-app-dev as public repository

  `anitodevops/react-app-prod:latest`

- react-app-prod as private repository

  `anitodevops/react-app-prod:latest`

![dockerrepo](https://github.com/anitodevops/Project-1/blob/dev/Images/Two%20DockerRepo's%20Creation.png)
