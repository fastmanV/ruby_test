require 'rspec'
require 'rack/test'
require 'json'

require "./heroku-sinatra-app.rb"
set :enviroment, :test

def app
Sinatra::Application

end


describe 'Unit Test' do
  include Rack::Test::Methods
  it "should load the home page" do


get '/'
expect(last_response.body).to include("Create Safe messages")
  end
end




describe 'Int Test' do
  include Rack::Test::Methods
  it "should load the home page" do

get '/'
expect(last_response.body).to include("Create Safe messages")
  end
  it 'shud add msg' do
post '/msg_add', params = {
        :text => 'test',
        :visit_limit  => '1',
      }

token =  JSON.parse(last_response.body)
puts token["url"]
get "#{token["url"]}"
expect(last_response).to be_ok
expect(last_response.body).to include("Enter password to decrypt your messages")
  end
end