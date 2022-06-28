# Use the official Node.js 10 image.
# https://hub.docker.com/_/node
FROM node:14

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy local code to the container image.
COPY . ./

#install dependencies
RUN npm install

#EXPOSE PORT
EXPOSE 3040

# Run the web service on container startup.
CMD [ "npm", "start"]
