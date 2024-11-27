FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies for sharp
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2 \
    libjpeg-dev \
    libpango1.0-dev \
    libgif-dev \
    librsvg2-dev \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy only package.json and package-lock.json to leverage Docker caching
COPY ./photography/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY ./photography/ ./

# Install pm2 globally
RUN npm install -g pm2

# Start the application with pm2
CMD ["pm2-runtime", "start", "ecosystem.config.js"]
