# Use Node official image
FROM node:18-alpine

# Set working directory
WORKDIR /zimbot

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy rest of the project
COPY . .

# Start the bot
CMD ["node", "--expose-gc", "index.js"]
