############################################################################################
input steps:
1. create a erc or docker repository and add the image url with tag under image section of container definiton file
2. terraform init
3. terraform plan
4. terraform apply
5. ECS ensure application availabiity all the time, you can define the desired, max and min count of Ec2 instance in asg.

container-definition.json : define docker containers to run in the form task to be executed by the ecs service on ecs cluster.
appication load balancer : to alow traffic to ecs service running task.
task definition: required to run docker container in ECS.
ecs service: to run and maintain particular no of task on ecs cluster.
ecs cluster: grouping of task and service.

Ec2 instance is running all the three containers. lb is connecting to nginx at port 80.
when hitting the DNS name for loadbalancer with port 80 nginx page is loading with message that page is unavailable, but the application is working as you can check at port 8080 of the Ec2 instance.
facing issue with mounting volumes in container defintion.
you need to change proxy_pass proxy_pass to http://0.0.0.0/0:8080/ in default.conf of nginx, since we are not using docker compose
