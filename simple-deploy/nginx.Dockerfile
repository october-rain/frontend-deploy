# 基础镜像
FROM nginx:alpine

# 将 index.html 添加到 nginx /usr/share/nginx/html 目录
ADD index.html /usr/share/nginx/html/