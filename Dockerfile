# Use a base image with apt support
FROM node:18-slim

# Install Git and required build tools
RUN apt-get update && apt-get install -y \
  git \
  python3 \
  make \
  g++ \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /zimbot

# Copy dependency manifests first
COPY package.json package-lock.json* ./

# Install all dependencies (Git is now available)
RUN npm install

# Copy the full source
COPY . .

# Start the bot
CMD ["node", "--expose-gc", "index.js"]
