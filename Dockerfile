# FROM node:latest
# WORKDIR /app
# COPY . .
# RUN npm install
# EXPOSE 3000
# CMD [ "node", "index.js" ]
FROM node:18-alpine AS installer
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

FROM nginx:latest AS deployer
COPY --from=installer /app /usr/share/nginx/html

