FROM node
ENV NODE_ENV production

WORKDIR /usr/src/appservice

COPY package*.json ./

RUN npm install

RUN openssl req -new -newkey rsa:4096 -days 360 -nodes -x509 -subj "C=DE/ST=NI/L=Local/0=Dev/CN=testsite.local" -keyout ./tls.key -out ./tls.crt

COPY . .

EXPOSE 3000
EXPOSE 3300
CMD ["node", "appservice.js"]