#require './heroku-sinatra-app'

## There is no need to set directories here anymore;
## Just run the application
#require 'active_record'
Dir.glob('./app/{models,controllers}/*.rb').each { |file| require file }
run Sinatra::Application
