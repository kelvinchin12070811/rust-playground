FROM rust:latest

# Source: https://dev.to/codingalex/run-vs-code-remote-tunnels-in-a-container-4lf4
RUN apt-get update && \
    apt-get install -y git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" \
    --output /tmp/vscode-cli.tar.gz && \
    tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
    rm /tmp/vscode-cli.tar.gz

CMD [ "code", "tunnel", "--accept-server-license-terms" ]
