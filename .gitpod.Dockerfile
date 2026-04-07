FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USE_CCACHE=1
ENV CCACHE_SIZE=30G

# 安装依赖
RUN apt-get update && apt-get install -y \
    bc bison build-essential ccache curl flex \
    g++-multilib gcc-multilib git gnupg gperf imagemagick \
    lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool \
    libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev \
    libxml2 libxml2-utils lzop pngcrush rsync schedtool \
    squashfs-tools xsltproc zip zlib1g-dev openjdk-8-jdk \
    python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装repo
RUN mkdir -p ~/bin && \
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && \
    chmod a+x ~/bin/repo

# 配置git
RUN git config --global user.name "Builder" && \
    git config --global user.email "builder@gitpod.io"

# 配置ccache
RUN ccache -M 30G

ENV PATH="$HOME/bin:$PATH"
WORKDIR /workspace/lineage
