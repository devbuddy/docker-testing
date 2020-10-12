# Automatic build enabled on https://hub.docker.com/r/devbuddy/testing/
# Images are tagged with the tags and branch names, except for master: "latest".

FROM circleci/golang:1.15.2

ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt-get --no-install-recommends -y install \
        git make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl zsh \
 && curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# Bashrc returns immediately when run in non-interactive mode, but we still want to change the PATH
RUN echo 'export PATH="/home/circleci/.pyenv/bin:$PATH"' > ~/.bashrc.new \
 && echo 'export PATH="/home/circleci/.pyenv/shims:${PATH}"' >> ~/.bashrc.new \
 && cat ~/.bashrc >> ~/.bashrc.new \
 && mv ~/.bashrc.new ~/.bashrc

RUN ~/.pyenv/bin/pyenv install 3.6.5 \
 && ~/.pyenv/bin/pyenv global 3.6.5

RUN curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sudo sh -s -- -b /usr/local/bin v1.31.0
RUN go get github.com/tcnksm/ghr
