FROM node
ENV NODE_ENV production

WORKDIR /usr/src/appservice

COPY package*.json ./

RUN npm install

# A webserver need a certificate for a HTTP over TLS connection (HTTPS). In this case, it is selfsigned and it will cause a warning in the webbrowser. It is just for testing.
RUN openssl req -new -newkey rsa:4096 -days 360 -nodes -x509 -subj "/C=DE/ST=NI/L=Local/0=Dev/CN=testsite.local" -keyout ./tls.key -out ./tls.crt

COPY . .

# These ports are used for HTTP(3000) and HTTPS(3300)
EXPOSE 3000
EXPOSE 3300

# Run it!
CMD ["node", "appservice.js"]