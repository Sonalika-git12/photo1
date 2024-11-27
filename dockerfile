# Use Node.js 18 as the base image
FROM amazonlinux:2

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies for sharp on Amazon Linux
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

# Install Node.js 18 (Amazon Linux doesn't include it by default)
RUN curl -sL https://rpm.nodesource.com/setup_18.x | bash - && \
    yum install -y nodejs

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
