const http = require('node:http')
const fs = require('node:fs')

const server = http.createServer((req, res) => {
  const html = fs.readFileSync('./index.html')
  res.end(html)
})

server.listen(3000, () => {
  console.log('正在监听 3000 端口')
})

