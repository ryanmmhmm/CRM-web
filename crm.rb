##

require 'sinatra'

@@crm_app_name = "NimubsCRM"

get '/' do
	erb :index
end

get '/contacts' do
	erb :contacts
end

