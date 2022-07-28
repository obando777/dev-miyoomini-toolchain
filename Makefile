.PHONY: shell
.PHONY: clean
	
TOOLCHAIN_NAME=miyoomini-toolchain
WORKSPACE_DIR := $(shell pwd)/workspace
SDCARD_PATH := $(shell pwd)/SDCARD

.build: Dockerfile
	mkdir -p ./workspace
	mkdir -p ./SDCARD
	docker build -t $(TOOLCHAIN_NAME) .
	touch .build

shell: .build
	docker run -it --rm -v "$(WORKSPACE_DIR)":/root/workspace -v "$(SDCARD_PATH)":/mnt/SDCARD $(TOOLCHAIN_NAME) /bin/bash

clean:
	docker rmi $(TOOLCHAIN_NAME)
	rm -f .build
