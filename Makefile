# Display general help about this command
help:
	@echo ""
	@echo "Welcome to docker-microsoft-server make"
	@echo ""
	@echo "make build"
	@echo "make publish"
	@echo "make run (for testing purposes)"
	@echo ""

default: help

build:
	@python build.py

publish:
	@docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
ifneq ("$(wildcard tags.txt)","")
	xargs < tags.txt -n 1 docker push
else
	@echo "No tags.txt. Please run build target first"
	exit 1
endif

run:
	docker run -p 25565:25565 -v $(shell pwd)/test/mnt/data:/data -e MC_SERVER_NAME="foo" -e MC_MAX_PLAYERS="4" -e MC_MEM_MS="1G" -e MC_MEM_MX="4G" ollieparsley/minecraft-server:1.16.3

