FROM node:16-alpine

WORKDIR /usr/src/app

# Install PostgreSQL client
RUN apk add --no-cache postgresql-client

COPY package*.json ./
RUN npm install

COPY . .
RUN chmod +x wait-for-db.sh

EXPOSE 3001

CMD ["./wait-for-db.sh", "npm", "start"]