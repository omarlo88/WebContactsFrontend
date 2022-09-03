# Etape 1
FROM node:latest as node
WORKDIR /app
#COPY package*.json ./
COPY . .
RUN npm install
RUN npm run build --prod

#Etape 2
FROM nginx:alpine
COPY --from=node /app/dist/WebAppContacts /usr/share/nginx/html
