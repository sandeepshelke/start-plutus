# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.191.1/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version: bionic, focal
ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
    automake \
    build-essential \
    pkg-config \
    libffi-dev \
    libgmp-dev \
    libssl-dev \
    libtinfo-dev \
    libsystemd-dev \
    zlib1g-dev \
    make \
    g++ \
    tmux \
    git \
    jq \
    wget \
    libncursesw5 \
    libtool \
    autoconf


ARG CABAL="cabal-install-3.4.0.0-x86_64-ubuntu-16.04.tar.xz"
# Download the relevant `cabal-install` (version 3.4.0.0) binary from https://www.haskell.org/cabal/download.html
RUN wget https://downloads.haskell.org/~cabal/cabal-install-3.4.0.0/$CABAL \
    && tar -xf $CABAL \
    && rm $CABAL \
    && mkdir -p ~/.local/bin \
    && mv cabal ~/.local/bin/

RUN wget https://downloads.haskell.org/ghc/8.10.4/ghc-8.10.4-x86_64-deb9-linux.tar.xz \
    && tar -xf ghc-8.10.4-x86_64-deb9-linux.tar.xz \
    && rm ghc-8.10.4-x86_64-deb9-linux.tar.xz \
    && cd ghc-8.10.4 \
    && ./configure \
    && sudo make install

ENV PATH=~/.local/bin:$PATH
