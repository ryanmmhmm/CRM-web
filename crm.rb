##

require 'sinatra'

@@crm_app_name = "NimubsCRM"

get '/' do
  erb :index, :layout => :layout
end

get '/contacts' do
  erb :contacts  # :layout => :post
end

get '/contacts/new' do
  erb :new_contact
end
