require 'yaml'
require './app'

settings = YAML.load_file('./config/settings.yml')

BoilerRoomAPI.run! do |server|
  
  ssl_options = {
    :private_key_file => settings['private_key_file'],
    :cert_chain_file => settings['cert_chain_file'],
    :verify_peer => false
  }
  server.ssl = true
  server.ssl_options = ssl_options
end

