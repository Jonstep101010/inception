run:
	cd srcs && docker compose up -d

down:
	cd srcs && docker compose down

clean:
	cd srcs && docker compose down -v

fclean: clean
	docker rmi srcs-mariadb:latest srcs-nginx:latest srcs-wordpress:latest

nuke: fclean
	yes | docker system prune -a
	$(MAKE) run

re: fclean run

eval:
	$(shell "docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null")