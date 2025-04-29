build:
	time docker build \
	  	--build-arg BUILD_ENV=dev \
		--tag backend-base-image:latest \
	  	--file Dockerfile ./

.PHONY: build
