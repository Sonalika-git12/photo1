# Dockerfile
FROM node:18

WORKDIR /usr/src/app

# Adjust the path if the package.json is inside a subfolder
COPY ./photography/package*.json ./ 

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
