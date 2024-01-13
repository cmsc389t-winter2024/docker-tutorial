
# this is the base image for our container
FROM node:10-alpine

# create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

# set the working directory to /home/node/app
WORKDIR /home/node/app

# copy package.json and package-lock.json to /home/node/app
COPY package*.json ./

# change the user to node so that we don't run as root (security)
USER node

# install all packages in package.json
RUN npm install

# copy the rest of the files to /home/node/app
EXPOSE 8080

# copy the rest of the files to /home/node/app
COPY --chown=node:node . .

# run the app
CMD node app.js