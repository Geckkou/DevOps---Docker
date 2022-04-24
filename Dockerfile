FROM node:14
WORKDIR /app-node-docker
EXPOSE 3000
COPY . .
RUN npm install
ENTRYPOINT npm start 