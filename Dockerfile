# /app /usr /lib
# FROM --platform=linux/amd64 node:19.2-alpine3.16
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16
FROM node:19.2-alpine3.16

# cd app
WORKDIR /app

#Dest /app
COPY package.json ./

# Instalar las dependencias
RUN npm install

#Dest /app
COPY . .

# Reakuzar testing
RUN npm run test

# Eliminar archivos y directorios no necesarios en PROD
RUN rm -rf test && rm -rf node_modules

# Unicamente las dependencias de prod
RUN npm install --prod

# Comando run de la imagen
CMD [ "node", "app.js" ]