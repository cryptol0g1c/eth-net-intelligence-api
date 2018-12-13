FROM keymetrics/pm2:8-alpine

WORKDIR /app

RUN apk add --update git \
    && npm install -g pm2

COPY package*.json ./

RUN npm install

COPY . ./

RUN mv app.docker.json app.json

CMD ["pm2-runtime", "start", "app.json"]