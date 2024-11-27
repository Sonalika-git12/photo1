FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies for sharp
RUN yum update -y && \
    yum install -y \
    gcc-c++ \
    make \
    cairo-devel \
    libjpeg-devel \
    pango-devel \
    giflib-devel \
    librsvg2-devel \
    vips-devel \
    && yum clean all

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
