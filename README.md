# 42-Inception
#### A 42 School project
<br>

Goal(s) : 
- create an infrastructure composed of nginx, wordpress and mariadb custom docker images.
- each docker file must be written from scratch, and built from the penultimate version of debian or alpine.
- each service must have its own docker file.
<br>

Features :
- fully functional wordpress interface, image uploading, page modification, moderation, etc.
- multiple domain names handling, redirecting to the static website / wordpress / adminer
- https enforced
- resilient data with docker volumes
- adminer setup for mariadb (bonus)
- redis cache for wordpress (bonus)
- FTP server for the wordpress container (bonus)
- static HTML/CSS website, from scratch (bonus)

Concept(s) learned :
- docker containers
- docker compose
- docker networks & volumes
- daemons and better understanding of processes
- nginx configuration & features, virtual servers, proxys.
- mariadb configuration
- wordpress configuration
- advanced shell scripting
- ssl certificates
- file transfer protocol
