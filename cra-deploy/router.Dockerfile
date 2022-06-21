FROM node:14-alpine AS router-builder

WORKDIR /code

ADD package.json package-lock.json /code/
RUN npm i

# 可以把 ADD . /code 改写成下面的方式。
# 这样可以避免其他不必要的文件改变而导致缓存失效了。
ADD public /code/public
ADD src /code/src
ADD tsconfig.json /code/tsconfig.json
# 下面两种写法有问题
# ADD public src tsconfig.json /code
# ADD public /code/public && src /code/src && tsconfig.json /code/tsconfig.json

# RUN pwd
# RUN ls -lah
RUN npm run build

# 选择更小体积的基础镜像
FROM nginx:alpine
ADD nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=router-builder code/build /usr/share/nginx/html


