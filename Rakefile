# Rakefile
require "sinatra/activerecord/rake"
require 'rspec/core/rake_task'


RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  task.pattern    = 'spec/**/*_spec.rb'
end


namespace :db do
  task :load_config do
    require "./heroku-sinatra-app.rb"
  end
end
