FROM node:18-alpine
WORKDIR /zimbot
COPY package.json ./
RUN npm install
COPY . .
CMD ["node", "--expose-gc", "index.js"]
