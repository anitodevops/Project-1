# Steps for Build Phase

## Step 7: GitHub Webhook Setup

### Add Webhook 
- Setup webhook to GitHub repo to trigger Jenkins pipeline automatically when code is Pushed to git repository

-	Go to GitHub Repo -> settings -> webhooks -> add Webhook 
    - URL : http://<public-ip>:8080/github-webhook/
    - Content type: application/json
    - Trigger: “push”

![webhook](https://github.com/anitodevops/Project-1/blob/dev/Images/Webhook%20Setup.png)
