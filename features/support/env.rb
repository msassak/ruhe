$:.unshift(File.expand_path(File.dirname(__FILE__) + '/../../lib'))
$:.unshift(File.expand_path(File.dirname(__FILE__)))

require 'ruhe/cucumber'

require 'rspec/expectations'

require 'ruhe_server'

Ruhe.base_url = "http://localhost:4567"

@_ruhe_server = Process.fork do
  Ruhe::Server.run!
end

sleep 1 # TODO: wait until GET /alive returns 200 OK, or use some form of IPC

at_exit do
  Process.kill('TERM', @_ruhe_server)
  Process.waitpid(@_ruhe_server)
end
