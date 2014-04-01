require_relative 'Rolodex.rb'
require_relative 'Contact.rb'
require 'sinatra'



get "/" do
	@@rolodex = Rolodex.new
	@crm_app = "My CRM" 
	erb :index
end

# post "/contacts" do
# 	puts params
# 	new_contact = Contact.new(params[:first_name])
# 	#@contacts << new_contact
# 	redirect to('ilia')

# end

get "/contacts" do
	@@contact_array = []
	erb :contacts
end

get "/contacts/new" do
	erb :contacts_new
end




# get "/:name" do
# 	puts params
# 	@name = params[:name].capitalize
	
# 	erb :name_page
# end

