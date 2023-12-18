# Project read me file

Prerquisites
1. There should be a SSH Key Pair created
2. There should be a Route53 domain registered to use
3. Create IMA user with relevant permissions with Access-Key and Secret-Access-Key to configure AWS CLI


Manual actions
* You have to push You have to push the docker image manully to the ECS Repository
* You can find a sample docker image in DockerHub
    Docker Hub URL : https://hub.docker.com/repository/docker/sgrsaga/project_repo_aws
* Download the docker image from docker hub
    # docker pull sgrsaga/project_repo_aws
* Tag the image to match for the ECR repo. In this case as below
    # docker tag sgrsaga/project_repo_aws:latest project_repo_aws:latest
* Then you can use the ECR push image commands to push the image to ECR Repository

Architecture:

![High Level architecture](ECS-Ec1.png)


![GitHub Actions based pipeline](GitHub_Action_CICD.png)