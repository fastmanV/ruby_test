require 'rubygems'
require 'sinatra'


class YourApplication < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end


#ActiveRecord::Migration.create_table :messages do |t|
 # t.string :name
#end
#SecureRandom.hex[0,10]




#u = Message.new(:name => 'sas')
#u.save
get '/' do
@users = Message.all
   erb :index
end


post '/cast' do
u = Message.new(:name => params[:name])
u.save
@users = Message.all
  erb :index
end
