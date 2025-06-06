FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .


FROM node:18
WORKDIR /app
COPY --from=builder /app .
EXPOSE 5173
CMD ["npm", "run", "dev"]

