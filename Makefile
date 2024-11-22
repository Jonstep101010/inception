run:
	cd srcs && docker compose build && docker compose up --remove-orphans -d

mariadb-health:
	cd srcs && docker compose exec mariadb mysqladmin ping -h localhost

down:
	cd srcs && docker compose down

clean:
	cd srcs && docker compose down -v
	sudo rm -rf ${HOME}/data/
	mkdir -p ${HOME}/data/{mariadb,wordpress,redis}

fclean: clean
	docker rmi mariadb:latest wordpress:latest nginx:latest redis:latest vsftpd:latest portfolio-zola:latest adminer:latest prometheus:latest mariadb-exporter:latest

nuke: fclean
	yes | docker system prune -a
	$(MAKE) run

re: fclean run

eval:
	$(shell "docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null")

genenv:
	bash ./genenv.sh