#!/bin/bash
#check if Docker is instaled
if 
	rpm -qa | grep docker-ce-  2>&1 > /dev/null; then echo "Docker is already installed."
#install Docker
else 
	curl -fsSL get.docker.com -o get-docker.sh
	chmod +x get-docker.sh
	sh get-docker.sh
	systemctl start docker
fi


##This it for container, checks if container exist and if so Deletes it. mount /var/lib/mysql on host and also /BATCAVE on host

if
	docker ps -q -f name=alfred ; then docker container stop alfred; docker container rm alfred; docker container run -p 3306:3306 -e MYSQL_RANDOM_ROOT_PASSWORD=yes --mount type=bind,src=/var/lib/mysql,dst=/var/lib/mysql --mount type=bind,source=/root/BATCAVE,target=/root/BATCAVE --name alfred -d kuven0107/mariadb_xtra:testing
fi

