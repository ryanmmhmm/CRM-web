##
require_relative './contact.rb'
require 'sinatra'

@@crm_app_name = "NimubsCRM"

get '/' do
  erb :index, :layout => :layout
end

get '/contacts' do
  Contact.create("Ryan", "Magowan", email: "magowan.ryan@gmail.com", notes: "Creator of @@crm_app_name")
  Contact.create("Blank", "User", email: "blank_user@email.com", notes: "Blank User default")
  Contact.create("This", "Is", email: "Another@email.com", notes: "User")

  erb :contacts  # :layout => :post
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts/modify' do
  erb :modify_contact
end

get '/contacts/delete' do
  erb :delete_contact
end


