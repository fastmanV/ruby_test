require 'rubygems'
require 'sinatra'
require 'active_record'
require 'mysql2'
require "sinatra/activerecord"




#ActiveRecord::Migration.create_table :messages do |t|
 # t.string :name
#end
#SecureRandom.hex[0,10]




#u = Message.new(:name => 'sas')
#u.save
get '/' do

   erb :index
end

