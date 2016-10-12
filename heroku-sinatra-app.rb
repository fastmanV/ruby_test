
#
require 'rubygems'
require 'sinatra'
require "sinatra/activerecord"
set :database_file, "/home/www/sinatra/config/database.yml"
set :public_folder, Proc.new { File.join(File.dirname(__FILE__), 'content') }
configure :production do
  # Configure stuff here you'll want to
  # only be run at Heroku at boot

  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end

require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.every '1m' do
#Message.where(del_timer:).each do |id|

Message.where.not('del_timer' => nil).each do |id|
Message.where("created_at <= ?", Time.now - id.del_timer.to_i.minutes).delete_all
#Message.delete(id.id)
end
#Message.delete.where('created_at >= ?', 1.minutes.ago)
  # do something every 3 hours
end
class YourApplication < Sinatra::Base
Dir.glob('./app/{models,controllers}/*.rb').each { |file| require file }
use Sinatra::Application
end