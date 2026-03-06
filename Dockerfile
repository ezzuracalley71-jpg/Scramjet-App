FROM node:20-alpine

RUN npm install -g pnpm

WORKDIR /app

RUN apk add --upgrade --no-cache python3 make g++

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

RUN pnpm install --frozen-lockfile

COPY . .

EXPOSE 8080

CMD ["node", "src/index.js"]
