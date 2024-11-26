# Use Node.js 18 as the base image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json to leverage Docker caching
COPY ./photography/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY ./photography/ ./

# Build the application (if required)
RUN npm run build

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]

