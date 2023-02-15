#section 1 - node app
#image
FROM node:16-alpine as builder

#work dir
WORKDIR /app

#copy node-modules
COPY package.json .

#install depndencies
RUN npm install

#give permission for the node_modules
RUN chown -R node:node /app/node_modules

#copy rest of the files
COPY ./ ./

#run command
RUN npm run build

#section 2 - nginx
FROM nginx

#copy from builder to nginx. can be seen in the docker hub
COPY --from=builder /app/build /usr/share/nginx/html




