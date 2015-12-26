require 'sinatra'
require 'sinatra/activerecord'

class HelloWorldApp < Sinatra::Base
  
  settings = YAML.load_file('./config/settings.yml')
  
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    username == settings['username'] and password == settings['password']
  end
  
  get '/' do
    "Hello, world!"
  end

  get '/:name' do
    "Hello, #{params[:name]}!"
  end
end