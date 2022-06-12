const http = require('node:http')
const fs = require('node:fs')

const dataStr = `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>front end deploy</title>
</head>
<body>
  hello OctoberRain ~
</body>
</html>
`

const server = http.createServer((req, res) => res.end(dataStr))

server.listen(3000, () => {
  console.log('正在监听 3000 端口')
})

