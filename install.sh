#!/bin/bash
#check if Docker is instaleed
if 
        rpm -qa | grep docker-ce-  2>&1 > /dev/null; then echo "Docker is already installed."
#install Docker
else
        curl -fsSL get.docker.com -o get-docker.sh
        chmod +x get-docker.sh
        sh get-docker.sh
        systemctl start docker
	dnf update docker-ce
fi


##This it for container, checks if container exist and if so Deletes it. mount /var/lib/mysql on host and also /BATCAVE on host

if
        docker ps -q -f name=alfred ; then docker container stop alfred; docker container rm alfred; docker container run -p 3306:3306 -e  MYSQL_ROOT_PASSWORD=Pa55w0rd --mount type=bind,src=/var/lib/mysql,dst=/var/lib/mysql --mount type=bind,source=/root/BATCAVE,target=/root/BATCAVE --name alfred -d kuven0107/mariadb_xtra:testing
fi

#Delay for DB to Start up properly
sleep 15

#Drop DB if exists
docker exec -it alfred mysql -uroot -pPa55w0rd -e "DROP DATABASE IF EXISTS wayneindustries"
#Add DB 
docker exec -it alfred mysql -uroot -pPa55w0rd -e "CREATE DATABASE wayneindustries"
#Add table to DB
docker exec -it alfred mysql -uroot -pPa55w0rd -D wayneindustries -e "CREATE TABLE fox(ID varchar(25),Name varchar(25))"
#Insert values 
docker exec -it alfred mysql -uroot -pPa55w0rd -D wayneindustries -e "INSERT INTO fox (ID , Name) VALUES ( '50' , 'batmobile')"

