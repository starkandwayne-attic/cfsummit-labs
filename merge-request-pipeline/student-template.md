## Introduction

## Learning Objectives
Concourse Gitlab Merge Request Resource Usage

# Environment

For this lab we will be using the following systems:

| UAA       | https://146.148.24.245:8443 |
| Concourse | https://146.148.24.245      |
| Gitlab    | http://104.155.34.223       |
| jumpbox   | 35.205.178.58:22            |

For all systems use your UAA account credentials

## Lab

### 1. Create an Account
Create a lab account [here](https://146.148.24.245:8443/create_account).

### 2. Fork the lab repo
Sign in to your gitlab account by using your UAA account (`Oauth2 Generic` button)
Fork http://104.155.34.223/lab/cfsummit-labs via gitlab UI

### 3. Clone your forked repo
SSH into jumpbox `ssh "email"@35.205.178.58` (email addresses need to be quoted)
Enter your UAA account password at the password promt (and hit enter)
```
git clone http://104.155.34.223/{your_username}/cfsummit-labs
```
You can copy the clone url from the gitlab interface.

### 4. Create your concourse pipeline
After cloning the repo on the jumpbox run the following commands:
```
cd cfsummit-labs/merge-request-pipeline/
./ci/repipe.sh
```
The repipe script will run `fly set-pipeline` to update the pipeline configuration in concourse.
You can view your pipeline in your browser [here](https://146.148.24.245)
It will be named `{username}-merge-request-pipeline`

### 5. Create a github merge request
From the gitlab ui create a new merge request.
Or use the following deeplink: http://104.155.34.223/{username}/cfsummit-labs/merge_requests/new
Make sure to replace your username in the url.

Choose your own repo as the target (as well as the source)
Use the `nice-feature` branch as the source branch and `master` as the target.

Click `Compare branches and continue`

Give it a title and click `Summit merge request`

### 6. Let concourse test your merge request
Watch your build happen in the concourse UI: https://146.148.24.245
Once it goes green the status of your merge request will be updated.

## Learning Objectives Review


## Beyond the Lab
