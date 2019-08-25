FROM node:alpine as builder
WORKDIR /usr/react-app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN ["npm", "run", "build"]

FROM nginx
COPY --from=builder /usr/react-app/build /usr/share/nginx/html/