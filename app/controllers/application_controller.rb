
require 'rubygems'
require 'sinatra'





get '/' do

   erb :index
end


post '/msg_add' do
safe_link = SecureRandom.hex[0,10]
msg = Message.new(:text => params[:text].to_s, :url => safe_link, :max_visit => params[:visit_limit], :del_timer => params[:deletetime])
if msg.save

 content_type :json
  { :url => "message/#{safe_link}" }.to_json
end
end


get '/message/:url' do
  @msg = Message.where(url: params[:url])



if @msg[0] != nil and @msg[0].max_visit != nil
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
