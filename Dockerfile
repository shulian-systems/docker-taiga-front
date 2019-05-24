FROM node:alpine
MAINTAINER Shulian Systems "contact@shulian.systems"

RUN mkdir /app
WORKDIR /app
RUN apk add --no-cache --virtual .build-tools git python2 build-base
RUN git clone https://github.com/taigaio/taiga-front-dist.git /app
COPY static.js /app

RUN npm i && node dist.js stable && npm install koa koa-static && apk del .build-tools

CMD ["node", "static.js"]
