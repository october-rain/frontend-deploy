FROM node:14-alpine AS cra-builder

WORKDIR /code

ADD package.json package-lock.json /code/

RUN npm i

ADD . /code
RUN npm run build 

# CMD npx serve -s build -p 80
# EXPOSE 80

FROM nginx:alpine
COPY --from=cra-builder /code/build /usr/share/nginx/html

