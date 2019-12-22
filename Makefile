export DOCKER_PYTHON_VERSION_TAG=3-alpine
export AWS_CLI_VERSION=1.16.308
export OWNER=sunakan
export REPOSITORY=docker-awscli
export IMAGE_NAME=awscli

build:
	docker build \
    -t ${REPOSITORY}/${IMAGE_NAME}:latest \
    --build-arg DOCKER_PYTHON_VERSION_TAG=${DOCKER_PYTHON_VERSION_TAG} \
    --build-arg AWS_CLI_VERSION=${AWS_CLI_VERSION} \
    .
	docker tag ${REPOSITORY}/${IMAGE_NAME}:latest ${REPOSITORY}/${IMAGE_NAME}:${AWS_CLI_VERSION}
	docker tag ${REPOSITORY}/${IMAGE_NAME}:latest docker.pkg.github.com/${OWNER}/${REPOSITORY}/${IMAGE_NAME}:${AWS_CLI_VERSION}

v:
	docker run --rm -it ${REPOSITORY}/${IMAGE_NAME} --version

login:
	docker login docker.pkg.github.com -u ${OWNER}

push:
	docker push docker.pkg.github.com/${OWNER}/${REPOSITORY}/${IMAGE_NAME}:${AWS_CLI_VERSION}
