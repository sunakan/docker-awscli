export DOCKER_PYTHON_VERSION_TAG=3-alpine
export AWS_CLI_VERSION=1.16.308

build:
	docker build \
    -t suna-awscli:latest \
    --build-arg DOCKER_PYTHON_VERSION_TAG=${DOCKER_PYTHON_VERSION_TAG} \
    --build-arg AWS_CLI_VERSION=${AWS_CLI_VERSION} \
    .
	docker tag suna-awscli:latest suna-awscli:${AWS_CLI_VERSION}

v:
	docker run --rm -it suna-awscli --version
