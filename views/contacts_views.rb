module ProductsViews
  def contacts_show_view(contact)
       puts "#{contact.full_name} - #{contact.id}"
        puts 
        puts "---------------"
        puts
        puts contact.email
        puts contact.phone_number
        puts contact.bio
    end 

  def contacts_index_view(contacts) contacts.each do |contact|
      puts "======================================"
      contacts_show_view(contact)
      end
  end
end 