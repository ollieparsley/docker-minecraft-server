# Display general help about this command
help:
	@echo ""
	@echo "Welcome to docker-microsoft-server make"
	@echo ""
	@echo "make build"
	@echo "make publish"
	@echo ""

default: help

build:
	@python build.py

publish:
	@docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
ifneq ("$(wildcard tags.txt)","")
	xargs < tags.txt -n 1 docker publish
else
	@echo "No tags.txt. Please run build target first"
	exit 1
endif

run:
	docker run -p 25565:25565 -e MC_SERVER_NAME="foo" ollieparsley/minecraft-server:latest

