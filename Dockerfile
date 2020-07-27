FROM node:latest

WORKDIR /

COPY . .

RUN npm install --production

EXPOSE 3000

ENTRYPOINT ["node", "index.js"]
