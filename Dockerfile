FROM node:20-alpine

WORKDIR /app

RUN apk add --upgrade --no-cache python3 make g++

COPY package.json ./

RUN npm install --legacy-peer-deps && npm rebuild

COPY . .

EXPOSE 8080

CMD ["node", "src/index.js"]
