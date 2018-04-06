## Introduction

## Learning Objectives
Concourse Gitlab Merge Request Resource Usage

## Prerequisites
Deployed Concourse
Gitlab Account (Register via UAA)
Gitlab API Token (https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)

## Lab

git clone <repo-url>
cd <repo>/merge-request-pipeline/

git checkout -b <your-new-branch-name>

<--Edit the files app.go model.go main_test.go; Remove the Comments and activate the GetAll Endpoint and Tests-->

git config user.email "your@email.org"
git config user.name "your-username"

git commit -am "your commit message"

<--If prompted for your password, use the Gitlab API Token you created earlier->>
git push --set-upstream origin <your-new-branch-name>


<--Open Gitlab in your Browser and create a Merge Request for your branch-->

## Learning Objectives Review


## Beyond the Lab
