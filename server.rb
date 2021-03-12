require 'socket'
server = TCPServer.new 8000
session = server.accept
session.close
#http server
$bot.run