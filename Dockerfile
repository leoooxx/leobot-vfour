# Use slim variant for smaller image but with apt support
FROM node:18-slim

# Install git and optional build tools (for native addons)
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set working dir
WORKDIR /zimbot

# Copy and install deps
COPY package.json ./
RUN npm install

# Copy everything else
COPY . .

# Start the bot
CMD ["node", "--expose-gc", "index.js"]
