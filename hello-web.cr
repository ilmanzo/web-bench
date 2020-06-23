# a very basic HTTP server, made in Crystal
require "http/server"

server = HTTP::Server.new do |context|
  context.response.content_type = "application/json"
  # context.response.print "{\"Hello\":\"World\"}"
  context.response.print %<{"Hello":"World"}>
  # context.response.print " Got request for path #{context.request.path} at local time #{Time.local}."
end

# check later how to bind to '0.0.0.0' instead of '127.0.0.1', could be useful when running in containers ...
address = server.bind_tcp 8000
puts "Listening on http://#{address} ..."
server.listen
