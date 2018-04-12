## Introduction

## Learning Objectives

## Prerequisites
- UAA Account (create one at https://146.148.24.245:8443/create_account)
- Access to Concourse https://146.148.24.245
- Access to Gitlab http://104.155.34.223 (login wiht `oauth generic` option)
- SSH to jumpbox (ssh "YOURUSERNAME@MAIL"@35.205.178.58)
- Access to CF

## Lab
login to the jumpbox
configure git
```
git config user.email "your@email.org"
git config user.name "your-username"
git commit -am "your commit message"
```
Get Repo
```
git clone <repo-url>
cd <repo>/blue-green-app-deployment/
git checkout -b <your-new-branch-name>
```
login to concourse with fly
```
fly --target lab login -k --concourse-url https://146.148.24.245
choose UAA
retrieve token from https://146.148.24.245/auth/oauth?team_name=main
````

provide your Cloudfoundry credentials in the credentials.yml
```
cp ci/credentials.yml.sample ci/credentials.yml
nano ci/credentials.yml
```

set/create concourse pipeline
```
fly -t lab set-pipeline -p blue-green-YOURNAME -c ci/pipeline.yml -l ci/credentials.yml
```
you will get a link to your pipeline (example: https://146.148.24.245/teams/main/pipelines/blue-green-ramonskie)
browse to that pipeline.
you will notice there as a big blue bar in the header of the webpage.
this means that the pipeline is paused.
you can unpause this in 2 ways (web or fly-cli)
1 web) select the 3 bars on the left so you will see the side bar
      press the play button
2 fly) `fly -t lab up -p blue-green-YOURNAME`

after several seconds you will see a flashing yellow box around the `unit-tests` this meanse the pipeline is running
click on it if you dare :)
after it turns green it will go to the next stage until it finished `deploy-staging`
you will notice that `deploy-prod` has not run. this is because we required it to be run with some human intervention
select `deploy-prod` press the big plus(+) sign on the right

we have our first app running on CF with a deployment pipeline.

lets test




## Learning Objectives Review

## Beyond the Lab
