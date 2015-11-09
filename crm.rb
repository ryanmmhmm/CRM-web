##
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, 'sqlite3:crm_dev.sqlite3')


class Contact

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
  @contacts = Contact.all
  erb :contacts  # :layout => :post
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts/new' do
  @contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :notes => params[:notes]
  )

  redirect to '/contacts'
end

get '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :view_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id/modify' do
  @contact =
  erb :modify_contact
end

delete '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.destory
  else
    raise Sinatra::NotFound
  end
  redirect to '/contacts'
end


