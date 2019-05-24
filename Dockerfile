FROM node:alpine
MAINTAINER Shulian Systems "contact@shulian.systems"

RUN mkdir /app
WORKDIR /app
RUN apk add --no-cache --virtual .build-tools git
RUN git clone https://github.com/taigaio/taiga-front-dist.git /app
COPY static.js /app

RUN npm i && npm install koa koa-static koa-mount && apk del .build-tools

RUN addgroup --gid 199 -S taiga && adduser -u 199 -S taiga -G taiga
RUN chown -R taiga:taiga /app
USER taiga

CMD ["node", "static.js"]
