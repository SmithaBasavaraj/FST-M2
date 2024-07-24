#specify the base image
FROM node:18-alpine

# set the working directory
WORKDIR /usr/app

#copy package.json inside the /use/app -- source [windows], dest [linux path]
COPY package.json ./

#install dependencies
RUN npm install

#copying restinside the /use/app
COPY ./ ./432docker 

#start web server
CMD ["npm","start"]