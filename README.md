# PROJECT – 1  E-commerce/OnlineShop

![image](https://github.com/anitodevops/Project-1/blob/dev/Images/CI%3ACD.png)

### Table Of Contents 

-	[Goal](https://github.com/anitodevops/Project-1/tree/dev#goal)
-	[Pre-Requisites](https://github.com/anitodevops/Project-1/tree/dev#pre-requisites)
-	[Application Deployment Architecture](https://github.com/anitodevops/Project-1/tree/dev#application-deployment-architecture)
-	[Architecture Overview](https://github.com/anitodevops/Project-1/tree/dev#architecture-overview)
-	[Steps to Build, Deploy & Monitor](https://github.com/anitodevops/Project-1/tree/dev#steps-to-build--deploy-the-application)
-	[Links](https://github.com/anitodevops/Project-1/tree/dev#links)
-	[Outcome](https://github.com/anitodevops/Project-1/tree/dev#outcome)
  
---
## Goal

To build a CI/CD workflow that automates the build & deploy phases of E-comm Application to deploy the application to a Production Ready State on AWS EC2  integrating with Git, Docker, Jenkins tools and to ensure that the application runs on Port 80 (HTTP).

## Pre-Requisites
-	[AWS Account](https://signin.aws.amazon.com/signup?request_type=register)
-	[GitHub Account](https://github.com/)
-	[DockerHub Account](https://hub.docker.com/)
-	[Source Code](https://github.com/sriram-R-krishnan/devops-build.git)
  
## Application Deployment Architecture 
![Architecture](https://github.com/anitodevops/Project-1/blob/dev/Images/Architecture.png)

## Architecture Overview

- Developer pushes code → GitHub Repo (dev/master)
- GitHub Webhook Triggers respective branch in Jenkins Pipeline’s 
- Jenkins automatically builds Docker images & pushes to its respective DockerHub Repository
- Application gets deployed on AWS EC2 (App-Production-Server) only if the trigger was made from the Masters Branch.
- Monitoring system checks the health of deployed app.

#### Server Roles:

**Workstation/Dev Server** The EC2 Ubuntu t2.micro instance where you build, test, and deploy the Dockerized React app.

**Prod Server** Represents the production environment.

## Steps To Build & Deploy the Application

> Below is the step-by-step implementation breakdown of the complete DevOps CD process.

### Pre-Build Phase

[Step 1: Local Workspace Configuration](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step1.md)

[Step 2: Create & Configure Application-Production Server](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step2.md)

[Step 3: Setup DockerHub Repositories](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step3.md)

[Step 4: Setup GitHub Repository](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step4.md)

### Build Phase

[Step 1: Clone the Source Code from Git Repository](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step5.md)

[Step 2: Dockerize the Application](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step6.md)

[Step 3: Bash Scripting](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step7.md)

[Step 4: Create .dockerignore & .gitignore files](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step8.md)

[Step 5: Create GitHub branch & Push Code](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step9.md)

[Step 6: Jenkins Pipeline Setup](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step10.md)

[Step 7: GitHub Webhook Setup](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step11.md)

### Deploy Phase

[Step 1: Code Push to Dev & Merge Dev to Master Branch](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step12.md)

[Step 2: Validate Jenkins Pipeline](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step13.md)

### Monitor Phase

[Step 1: Setup Prometheus Targets](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step14.md)

[Step 2: Create Dashboards in Grafana](https://github.com/anitodevops/Project-1/blob/dev/Steps/Step15.md)

## Links

-	Application is accessible via http://3.109.108.249:80

## Outcome

-	Fully automated CI/CD deployment pipeline using Jenkins.
-	Separately on dev and prod environments for controlled releases where Docker Hub repositories (Dev - public, Prod - private) and simulate the Dev → Prod pipeline via Jenkins.
-	Basic Monitoring ensures Reliability & Uptime.

