require_relative 'Rolodex.rb'
require_relative 'Contact.rb'
require 'sinatra'

@@rolodex = Rolodex.new

get "/" do
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

