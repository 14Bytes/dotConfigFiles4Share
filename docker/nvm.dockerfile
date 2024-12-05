FROM alpine:latest

# 安装必要依赖
RUN apk add --no-cache curl bash gcompat libstdc++

# 安装 NVM
ENV NVM_VERSION=0.40.1
ENV NVM_DIR /root/.nvm
# RUN curl -o- https://github.com/nvm-sh/nvm/archive/refs/tags/v${NVM_VERSION}.tar.gz | tar xz -C /root/.nvm --strip-components=1
# 手动下载拷贝进入镜像内
COPY nvm-0.40.1.tar.gz /root/
RUN mkdir -p /root/.nvm \
    && tar -zxvf /root/nvm-${NVM_VERSION}.tar.gz -C /root/.nvm --strip-components=1 \
    && rm -rf /root/nvm-${NVM_VERSION}.tar.gz

ENV NVM_NODEJS_ORG_MIRROR=https://unofficial-builds.nodejs.org/download/release

# 加载 NVM 并安装 Node.js 版本
RUN bash -c "source $NVM_DIR/nvm.sh && \
nvm install 10.24.1 && \
nvm install 12.22.12 && \
nvm install 14.21.3 && \
nvm install 16.20.2 && \
nvm install 18.20.5 && \
nvm use 16.20.2 && \
nvm alias default 16.20.2 && \
node -v && npm -v"