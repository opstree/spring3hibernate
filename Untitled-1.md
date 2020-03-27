Provisioning:-
**Provision application servers, for example - java, tomcat are required for a java project.**
![](./image1.png)
![](/home/upasna/ansible/March19/Screenshot from 2020-03-27 09-54-45.png)

Build:-
**Build any Project - can be java or any other language using jenkins.**
![](/home/upasna/ansible/March19/Screenshot from 2020-03-27 10-00-55.png)
![](/home/upasna/ansible/March19/Screenshot from 2020-03-27 10-00-58.png)
![](/home/upasna/ansible/March19/Screenshot from 2020-03-27 10-01-48.png)

Deployment:-

Create a down stream deployment job to the build job .
**In the deployment job , deploy the artifact (war in case of java) to the application server (tomcat/joboss) using ansible in the downstream job.**
![](/home/upasna/ansible/March19/Screenshot from 2020-03-27 10-06-32.png)
![](/home/upasna/ansible/March19/Screenshot from 2020-03-27 10-06-47.png)
