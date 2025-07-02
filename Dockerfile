FROM node:18-slim

# Install git + build essentials if needed
RUN apt-get update && apt-get install -y \
    git \
    python3 g++ make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /zimbot

COPY package.json ./
RUN npm install

COPY . .

CMD ["node", "--expose-gc", "index.js"]
