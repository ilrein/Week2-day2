require_relative 'Rolodex.rb'
require_relative 'Contact.rb'
require 'sinatra'

@@rolodex = Rolodex.new
@@rolodex.create_contact("Worgen Infiltrator", "Worgen", "1-2-1", "Stealth")


#-----------first things that happen!-------------------------

get "/" do #first page goes to the index/homepage
	erb :index
end

get "/contacts/new" do #when "add contact!" is clicked, lead user to contacts_new page
	erb :contacts_new
end

post '/contacts' do #when receiving info from contacts_new, execute this code
  @@rolodex.create_contact(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to ('/contacts')
end


#------------redirecting to the "view all contacts page"--------------------

get "/contacts" do
	erb :contacts
end

#---------------------------------------

post "/redirect" do
	erb :index
end



get "/contacts/:id" do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

# get "/contacts/:id/edit" do
# 	@contact = @@rolodex.find(params[:id].to_i)
# 	if @contact
# 		erb :edit_contact
# 	else
# 		raise Sinatra::NotFound
# 	end
# end

post "/contacts/id/edit" do
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

delete "/contacts/:id" do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		@@rolodex.delete_contact(@contact)
		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end