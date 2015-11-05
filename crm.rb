##
require_relative './contact.rb'
require 'sinatra'

@@crm_app_name = "NimubsCRM"

get '/' do
  erb :index, :layout => :layout
end

get '/start' do
  Contact.create("Ryan", "Magowan", email: "magowan.ryan@gmail.com", notes: "Creator of @@crm_app_name")
  Contact.create("Blank", "User", email: "blank_user@email.com", notes: "Blank User default")
  Contact.create("This", "Is", email: "Another@email.com", notes: "User")
  redirect to '/'
end

get '/contacts' do
  erb :contacts  # :layout => :post
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts/new' do
  Contact.create(params[:first_name], params[:last_name], email: params[:email], notes: params[:notes])

  redirect to '/contacts'
end

get '/contacts/modify' do
  erb :modify_contact
end

get '/contacts/delete' do
  erb :delete_contact
end


