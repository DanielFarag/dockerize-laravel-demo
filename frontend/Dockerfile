FROM node:20 as base

WORKDIR /base

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build



FROM alpine

WORKDIR /app

COPY --from=base /base/dist /app