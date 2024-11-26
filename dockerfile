# Use Node.js 18 as the base image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json to leverage Docker caching
COPY photography/package*.json ./

# Install dependencies with options to handle cache and integrity issues
RUN npm cache clean --force && npm config set registry https://registry.npmjs.org/ && npm install --prefer-offline --legacy-peer-deps

# Copy the rest of the application files
COPY photography/ ./

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
