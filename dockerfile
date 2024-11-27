# Use Node.js 18 as the base image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json to leverage Docker caching
COPY ./photography/package*.json ./

# Install dependencies
RUN npm install -g pm2

# Copy the rest of the application files
COPY ./photography/ ./


# Start the application
CMD ["npm", "start","pm2", "start"]


