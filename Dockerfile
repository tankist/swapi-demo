FROM node:12.14-alpine

RUN set -x && \
    apk update && \
    apk add --update sqlite && \
    rm -rf /var/cache/apk/*

WORKDIR /src

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN set -x && \
    npm run seed

CMD ["npm", "start"]
