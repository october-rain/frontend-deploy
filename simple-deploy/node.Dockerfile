# 选择一个体积小的镜像 (~5MB)
FROM node:14-alpine

# 设置为工作目录，以下 RUN/CMD 命令都是在工作目录中进行执行
WORKDIR /Dcode

# 把代码置于镜像
ADD . /Dcode

# # 装包
# RUN yarn

# 启动 Node Server
CMD npx serve . -p 8080

# 暴露容器的 8080 端口
EXPOSE 8080