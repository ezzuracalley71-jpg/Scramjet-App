FROM node:18-alpine

RUN npm install -g pnpm

WORKDIR /app

COPY package.json ./

RUN apk add --upgrade --no-cache python3 make g++

RUN pnpm install --no-frozen-lockfile
RUN pnpm approve-builds --all
RUN pnpm rebuild

COPY . .

EXPOSE 8080

CMD ["pnpm", "start"]
