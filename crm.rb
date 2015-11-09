##
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, 'sqlite:crm_development.sqlite3')


class Contact

  attr_accessor :id, :first_name, :last_name, :email, :notes
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :notes, Text


end

DataMapper.finalize
DataMapper.auto_upgrade!

@@crm_app_name = "NimubsCRM"

get '/' do
  erb :index # sinatra default :layout => :layout
end

get '/contacts' do
  erb :contacts  # :layout => :post
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts/new' do
  Contact.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], notes: params[:notes])

  redirect to '/contacts'
end

get '/contacts/modify' do
  erb :modify_contact
end

get '/contacts/delete' do
  erb :delete_contact
end


