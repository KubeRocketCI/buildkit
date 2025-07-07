FROM moby/buildkit:v0.23.2

LABEL maintainer="KRCI Team"

RUN apk add --no-cache curl=8.12.1-r1 \
                       jq=1.7.1-r0

RUN curl -Lo /usr/local/bin/docker-credential-ecr-login \
    https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.10.1/linux-amd64/docker-credential-ecr-login && \
    chmod +x /usr/local/bin/docker-credential-ecr-login
