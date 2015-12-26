# Rakefile
require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./app"
  end
end

namespace :projects do
  
  require "./app"
  
  desc 'create a new project'
  task :create, [:name] do |t, args|
    Project.create(name: args[:name])
  end
  
  desc 'Add a choice to a project'
  task :add_choice, [:project_id, :description] do |t, args|
    pc = Choice.new(description: args[:description])
    pc.project = Project.find_by(id: args[:project_id].to_i)
    pc.save
  end
  
  desc 'Add an observation to a project'
  task :add_observation, [:project_id, :text_data] do |t, args|
    ob = Observation.new(text_data: args[:text_data])
    ob.project = Project.find_by(id: args[:project_id].to_i)
    ob.save
  end
  
end