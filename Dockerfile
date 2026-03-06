FROM node:18-alpine

RUN npm install -g pnpm

WORKDIR /app

COPY package.json ./

RUN apk add --upgrade --no-cache python3 make g++

RUN echo "approve-builds[]=@mercuryworkshop/scramjet\napprove-builds[]=bufferutil" >> .npmrc

RUN pnpm install --no-frozen-lockfile

COPY . .

EXPOSE 8080

CMD ["pnpm", "start"]
