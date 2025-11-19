# Steps for Deploy Phase

## Step 1: Code Push to Dev & Master Branch to Trigger Jenkins Pipeline

### Push Files from Local Workspace to git repo - dev branch 

	`git push origin dev`

###	Create Master branch 

    `git branch -M master 

### Switch to master branch 

    `git checkout master`

### Merge dev branch to master branch

    `git merge dev`

### Push master branch to Git repo 

    `git push -u origin master`

Jenkins automatically reacts to GitHub push & triggering builds.
