require_relative 'contact.rb'

class CRM

  def initialize(name)
    @name = name

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
  case user_selected
  when 1 then add_new_contact
  when 2 then modify_existing_contact
  when 3 then delete_a_contact
  when 4 then display_all_the_contacts
  when 5 then search_by_attribute
  when 6 then exit
  end
end

def add_new_contact
  print 'Enter First Name: '
  first_name = gets.chomp

  print 'Enter Last Name: '
  last_name = gets.chomp

  print 'Enter Email Address: '
  email = gets.chomp

  print 'Enter a Note: '
  note = gets.chomp

  Contact.create(
  first_name: first_name,
  last_name: last_name,
  email: email,
  note: note
  )
end


  def modify_existing_contact
    print 'Enter the name of the contact: '
     value = gets.chomp
     contact_to_edit = Contact.find_by(first_name: value)


    print 'Enter the value you want to change: '
      value_to_change = gets.chomp

    print 'Enter the new vlaue : '
      new_value_to_use = gets.chomp
      new_entry = {value_to_change => new_value_to_use}
      contact_to_edit.update(new_entry)
      return contact_to_edit
  end


  def delete_contact
    print "Enter the name of the contact "
    contact_delete = gets.chomp
    contact_to_delete = Contact.find_by(contact_delete
    contact_to_delete.delete

  end

  def display_all_contacts
    Contact.all.inspect
  end

  def search_by_attribute
  puts "What attribute do you want to search by?\n[first_name]\n[last_name]\n[email]\n[note]"
  attribute = gets.chomp
  puts "Who are you searching for?"
  value = gets.chomp
  value.capitalize!
  Contact.find_by(attribute => value)
  puts Contact.find_by(attribute => value)

  end
  #not sure if this goes outside of end 
  at_exit do
  ActiveRecord::Base.connection.close
end

end
