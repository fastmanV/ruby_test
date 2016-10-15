
#
require 'rubygems'
require 'sinatra'
require "sinatra/activerecord"
set :database_file, "config/database.yml"
set :public_folder, Proc.new { File.join(File.dirname(__FILE__), 'content') }
configure :production do

end

require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.every '1m' do

Message.where.not('del_timer' => nil).each do |id|
Message.where("created_at <= ?", Time.now - id.del_timer.to_i.minutes).delete_all

end

end
class MyApplication < Sinatra::Base
Dir.glob('./app/{models,controllers}/*.rb').each { |file| require file }
use Sinatra::Application
end