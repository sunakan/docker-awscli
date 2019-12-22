ARG DOCKER_PYTHON_VERSION_TAG
FROM python:${DOCKER_PYTHON_VERSION_TAG} as aws

ARG AWS_CLI_VERSION
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}

RUN apk -uv add --no-cache jq less \
  && pip install --no-cache-dir awscli==${AWS_CLI_VERSION}

WORKDIR /aws

ENTRYPOINT [ "aws" ]
