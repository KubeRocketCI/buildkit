FROM moby/buildkit:v0.35.0

LABEL maintainer="KRCI Team"

ARG ECR_LOGIN_VERSION=0.13.0

# unpinned on purpose: pick up security fixes (exact pins break rebuilds)
# hadolint ignore=DL3018
RUN apk add --no-cache curl jq

RUN curl -fsSL -o /usr/local/bin/docker-credential-ecr-login https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/${ECR_LOGIN_VERSION}/linux-amd64/docker-credential-ecr-login && \
    curl -fsSL -o /tmp/docker-credential-ecr-login.sha256 https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/${ECR_LOGIN_VERSION}/linux-amd64/docker-credential-ecr-login.sha256 && \
    echo "$(cut -d' ' -f1 /tmp/docker-credential-ecr-login.sha256)  /usr/local/bin/docker-credential-ecr-login" > /tmp/ecr.sha256 && \
    sha256sum -c /tmp/ecr.sha256 && \
    rm /tmp/docker-credential-ecr-login.sha256 /tmp/ecr.sha256 && \
    chmod +x /usr/local/bin/docker-credential-ecr-login
