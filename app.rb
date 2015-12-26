require 'sinatra'
require 'sinatra/activerecord'
require 'json'
# Require all the models
require './models.rb'

class BoilerRoomAPI < Sinatra::Base
  
  settings = YAML.load_file('./config/settings.yml')
  
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    username == settings['username'] and password == settings['password']
  end
  
  # Just accept json
  before do
    content_type :json
  end
  
  get '/next_observation/:project_id' do
    # Get the next observation
    
    if !Project.exists?(params['project_id']) then
      halt 204, {'Content-Type' => 'text/plain'}, 'Project does not exist'
    end
    
    next_observation = Observation.next_to_classify(project_id: params['project_id'])
    
    if next_observation.nil? then
      halt 204, {'Content-Type' => 'text/plain'}, 'No more observations to classify!'
    end
    
    choices = next_observation.project.choices
    choices_formatted = choices.map {|choice| {choice_id: choice.id, description: choice.description} }
    response = {observation_id: next_observation.id, text: next_observation.text_data,choices: choices_formatted}
    response.to_json
  end
  
  post '/classify' do
    request_json = JSON.parse(request.body.read)
    puts request_json
    # We need the observation_id and the choice id
    if ( !(request_json.has_key?('observation_id') && request_json.has_key?('choice_id')) ) then
      halt 550, {'Content-Type' => 'text/plain'}, 'Wrong request format.'
    end
    
    # Try to create the classification
    cl = Classification.create(observation_id: request_json['observation_id'],
                              choice_id: request_json['choice_id'])
                    
    if (!cl.valid?) then
      halt 550, {'Content-Type' => 'text/plain'}, 'invalid request'
    end
    
  end


end