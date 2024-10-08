FROM node:18-alpine

WORKDIR /app/backend

COPY package*.json ./
RUN npm install

COPY . .

WORKDIR /app/frontend

COPY contacts-app-frontend/package*.json ./
RUN npm install -g @angular/cli && npm install

COPY ./contacts-app-frontend .


EXPOSE 5000
EXPOSE 4200 

CMD ["sh", "-c", "node server.js & ng serve"]
