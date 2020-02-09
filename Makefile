.PHONY: run shell

IMAGE := jupyter-geopyspark

all: 
	docker build -t $(IMAGE) .

run:
	sudo sysctl -w vm.swappiness=10
	docker run -it --rm --name jupyter-geopyspark \
          -p 8888:8888 -p 4040:4040 \
          -p 2012:2012 \
          -v $(shell pwd)/notebooks:/home/jovyan/work:rw \
          $(IMAGE)
	sudo sysctl -w vm.swappiness=60

shell:
	docker exec -it jupyter-geopyspark bash