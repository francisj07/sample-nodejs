FROM node:alpine

WORKDIR /usr/src/opt
COPY package*.json ./
RUN npm install --production
COPY . .
RUN adduser -D app
RUN chown -R app:app /usr/src/opt
USER app
EXPOSE 3000
CMD ["node", "index.js"]

