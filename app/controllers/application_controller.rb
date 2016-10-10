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
@msg = Message.all
   erb :index
end


post '/msg_add' do
safe_link = SecureRandom.hex[0,10]
msg = Message.new(:text => params[:text], :url => safe_link, :max_visit => params[:visit_limit], :del_timer => params[:deletetime])
msg.save

 content_type :json
  { :url => "message/#{safe_link}" }.to_json
end

get '/message/:url' do
  @msg = Message.where(url: params[:url])



if @msg[0].max_visit != nil
  cur = (@msg[0].current_visit.to_i + 1)
@msg[0].update(:current_visit => cur)
if @msg[0].current_visit >= @msg[0].max_visit
Message.delete(@msg[0].id)
	end
  end


  erb :show
end

get '/delete_all' do
 'aaa'
 Message.delete_all

	end