FROM node:14-alpine AS oss-builder 

# 获取参数
ARG ACCESS_KEY_ID
ARG ACCESS_KEY_SECRET 
ARG ENDPOINT
ENV PUBLIC_URL https://cra-deploy.oss-cn-hangzhou.aliyuncs.com/

WORKDIR /code 

# 为了更好的缓存，把它放在前边
# 可以通过 $xxx 直接使用前面的参数
RUN wget http://gosspublic.alicdn.com/ossutil/1.7.7/ossutil64 -O /usr/local/bin/ossutil \
  && chmod 755 /usr/local/bin/ossutil \
  && ossutil config -i $ACCESS_KEY_ID -k $ACCESS_KEY_SECRET -e $ENDPOINT

# 单独分离 package.json，是为了安装依赖可最大限度利用缓存
ADD package.json package-lock.json tsconfig.json /code/
RUN npm i 

ADD . /code
RUN npm run build && npm run oss:cli

# 选择更小体积的基础镜像
FROM nginx:alpine
ADD nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=oss-builder code/build /usr/share/nginx/html
