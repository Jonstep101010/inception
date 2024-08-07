run:
	cd srcs && docker compose up -d

clean:
	cd srcs && docker compose down

re: clean run

eval:
	$(shell "docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null")