const http = require('node:http')
const fs = require('node:fs')
const fsp = require('node:fs/promises')

const dataStr = 'test'

const server = http.createServer(async (req, res) => {
  
  const stat = await fsp.stat('./index.html')
  console.log('stat', stat)
  
  res.setHeader('content-length', stat.size)

  fs.createReadStream('./index.html').pipe(res)
})

server.listen(3000, () => {
  console.log('正在监听 3000 端口')
})

