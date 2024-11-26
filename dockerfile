# Use Node.js 18 as the base image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json to leverage Docker caching
COPY photography/package*.json ./

RUN npm install

# Install PM2 globally
RUN npm install -g pm2

# Copy the entire application code to the container
COPY . .

# Expose the application port
EXPOSE 8093

# Start the application with PM2
CMD ["pm2-runtime", "server.js"]

