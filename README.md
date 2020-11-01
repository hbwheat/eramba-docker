# eramba-docker
Eramba instance on Docker. 


https://downloadseramba.s3-eu-west-1.amazonaws.com/CommunityTGZ/latest.tgz



App container has init script to configure db or connect if data already exits. 

db container is just a maria db instance 

app container 

proxy to app

proxy is a simple label defiend container description via compose

app container uses init scripts env variables to conneect configure local ini files at runtime. 

app container uses powershell core for scripting