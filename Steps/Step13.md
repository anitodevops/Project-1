# Steps for Deploy Phase

## Step 2: Validate Jenkins Pipeline

### Validate jenkins pipeline status for Both Branches

### Multibranch Pipeline Result in Jenkins.

-	Verify jenkins pipeline Result for dev branch

![dev](https://github.com/anitodevops/Project-1/blob/dev/Images/DEV%20Pipeline%20Result.png)

-	Verify jenkins pipeline Result for master branch

![master](https://github.com/anitodevops/Project-1/blob/dev/Images/Pipeline-%20Master%20build.png)

-	Check the build logs in console output for your triggered master branch.

![masterlogs](https://github.com/anitodevops/Project-1/blob/dev/Images/Master%20-%20Pipeline%20Log.png)

### Build stage success state via Docker Repository

-	Verify build stage – image is added to Docker Repo – react-app-dev 

![docker-dev](https://github.com/anitodevops/Project-1/blob/dev/Images/DockerRepo%20for%20Dev%20Env.png)

-	Verify build stage – image is added to Docker Repo – react-app-dev 

![docker-master](https://github.com/anitodevops/Project-1/blob/dev/Images/DockerRepo%20for%20Prod%20Env.png)

### Docker container running in App-Prod-Server.

![container](https://github.com/anitodevops/Project-1/blob/dev/Images/App%20Deployed%20to%20Prod%20Server%20-%20master%20trigger.png)

### Website using Public IP of App-Prod-Server

![website](https://github.com/anitodevops/Project-1/blob/dev/Images/OnlineShop%20Website.png)

### Consolidated Pipeline branch execution status – two branches & their latest run 

![twobranches](https://github.com/anitodevops/Project-1/blob/dev/Images/Two%20Branches.png)

### Validate using Webhook Trigger Logs 

- Webhooks  Recent Deliveries should show a 200 OK response from Jenkins.

![webhooklogs](https://github.com/anitodevops/Project-1/blob/dev/Images/Webhook%20Logs.png)

