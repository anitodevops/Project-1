# Steps for Build Phase

## Step 2: Dockerize the Application

### Create a Dockerfile & build the image & test it locally 

- Build docker image
  
  `docker build -t anitodevops/app-image:latest .`

- View docker image
  
  `docker images`

- Run docker container using docker image
  
  `docker run -d --name container anitodevops/app-image:latest`

- View running containers
  
  `docker ps`

![dockerimage](https://github.com/anitodevops/Project-1/blob/dev/Images/Dockerfile-localbuild.png)

  Note: By default Nginx listens to Port 80

### Create a Docker-compose file 

- Create docker-compose.yaml file & run app-container using the previously built image.

  ` docker-compose up -d` or ` docker-compose up --build `

- View running docker containers
  
  ` docker-compose ps`
![docker-compose](https://github.com/anitodevops/Project-1/blob/dev/Images/Docker-compose%20Run%20.png)

-	Browser Verification: http://<public-IP>:80
  
![website](https://github.com/anitodevops/Project-1/blob/dev/Images/output%20of%20Docker-compose%20.png)

- Stop Docker Container
  
  ` docker-compose down`
