require 'unirest'

require_relative 'controllers/contacts_controller'
require_relative 'models/contact'
require_relative 'views/contacts_views'

class Frontend
  include ContactsController
  include ProductsViews
  def run 
    while true 
      system "clear"

      puts "You have engaged your Contacts Program"
      puts "Please, choose an option: "
      puts "      [1] Show all contacts"
      puts "          [1.1] Search contacts by name"
      puts "          [1.2] Sort contacts by name"
      puts "      [2] Show one contact"
      puts "      [3] Create a new contact"
      puts "      [4] Update a contact"
      puts "      [5] Destroy a contact"
      puts 
      puts "        [q] press 'q' to quit "

      input_option = gets.chomp
      system "clear"

      if input_option == "1"
        contacts_index_action 
        
      elsif input_option == "1.1"
        print "Enter a name to search by: "
        input_name = gets.chomp
        response = Unirest.get("http://localhost:3000/contacts?search=#{input_name}")
        contacts = response.body
        puts JSON.pretty_generate(contacts)

      elsif input_option == "1.2"
        resonse = Unirest.get("http://localhost:3000/contacts?sort=#{last_name}")
        contacts = response.body 
        puts JSON.pretty_generate(contacts)
      elsif input_option == "2"
        contacts_show_action
       
      elsif input_option == "3"
        contacts_create_action
        
      elsif input_option == "4"
        contacts_update_action

      elsif input_option == "5"
        contacts_destroy_action 
      elsif input_option == "q"
      puts "thanks for stopping by"
      exit    
      end 
    end   
  end
end 
