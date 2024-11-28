FROM nodejs

# Set the working directory
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json to leverage Docker caching
COPY ./photography/package*.json ./

# Install dependencies
RUN npm install -g pm2

# Copy the rest of the application files
COPY ./photography/ ./

# Install pm2 globally
RUN npm install -g pm2

# Start the application with pm2
CMD ["pm2-runtime", "start", "ecosystem.config.js"]
