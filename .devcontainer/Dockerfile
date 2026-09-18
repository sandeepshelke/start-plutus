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

# # Download specific Android Studio bundle (all packages).
# RUN apt-get install -y curl unzip

# RUN wget 'https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2020.3.1.25/android-studio-2020.3.1.25-linux.tar.gz' && \
#   tar -zxvf android-studio-2020.3.1.25-linux.tar.gz && rm android-studio-2020.3.1.25-linux.tar.gz

# # Install X11
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get install -y xorg


# # Install other useful tools
# RUN apt-get install -y vim ant

# # install Java
# RUN apt-get install -y default-jdk

# # Install prerequisites
# RUN apt-get install -y libz1 libncurses5 libbz2-1.0:i386 libstdc++6 libbz2-1.0 lib32stdc++6 lib32z1

# # Clean up
# RUN apt-get clean
# RUN apt-get purge
