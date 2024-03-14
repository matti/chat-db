FROM node:20.11.0-alpine
ENV NODE_PATH=/node_modules

RUN apk add --no-cache \
  bash curl

RUN set -eux ; \
  [ "$(uname -m)" = "aarch64" ] && arch=aarch64 || arch=i686 ; \
  mkdir /ghjk && cd /ghjk ; \
  curl -Lsf -O "https://github.com/tsl0922/ttyd/releases/download/1.7.4/ttyd.${arch}" ; \
  chmod +x "ttyd.${arch}" ; \
  mv "ttyd.${arch}" /usr/local/bin/ttyd ; \
  rm -rf /ghjk

WORKDIR /app

COPY app/package*.json .
RUN npm install

COPY app .

EXPOSE 3000
ENTRYPOINT [ "/app/entrypoint.sh", "web" ]
