require_relative 'Rolodex.rb'
require_relative 'Contact.rb'
require 'sinatra'

@@rolodex = Rolodex.new
@@rolodex.create_contact("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
contact = @@rolodex.find(1000)


get "/" do
	@crm_app = "My CRM" 
	erb :index
end

post "/redirect" do
	erb :index
end

get "/contacts" do
	erb :contacts
end

get "/contacts/new" do
	erb :contacts_new
end

# post '/contacts'  do
# 	puts params
# end

post '/contacts' do
  #new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.create_contact(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to ('/contacts')
end

get "/contacts/:id" do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get "/contacts/:id/edit" do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

put "/contacts/:id" do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.note = params[:note]

		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end