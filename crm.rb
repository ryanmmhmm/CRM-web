##

require 'sinatra'

@@crm_app_name = "NimubsCRM"

get '/' do
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end
