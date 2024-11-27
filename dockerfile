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
# Stage 2: Nginx to serve the built application
FROM nginx:alpine

# Set up a directory for the application
WORKDIR /usr/share/nginx/html

# Remove default Nginx static files
RUN rm -rf ./*

# Copy the built application from the Node.js build stage
COPY --from=builder /usr/src/app/build/ ./

# Copy custom Nginx configuration if needed (uncomment and provide your config file)
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

