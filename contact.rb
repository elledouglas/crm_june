gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact
  attr_reader :id
 attr_accessor :first_name, :last_name, :email
 @@contacts = []
 @@id = 1


  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email

    @id = @@id
 @@id += 1 # this way the next contact will get a different id
  end
  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
        new_contact = Contact.new(first_name, last_name, email, note)
        @@contacts << new_contact
        new_contact
  end

  # This method should return all of the existing contacts
  def self.all

  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
    return contact
end
end
end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
     if attribute == 'first_name'
        self.first_name = value

    elsif attribute == 'last_name'
      self.last_name = value

    elsif attribute == 'email'
      self.email = value

    elsif attribute == 'note'
      self.note = value
end
end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty


def self.find_by(attribute, value)
 @@contacts.each do |contact|
   if attribute == 'first_name' && contact.first_name == value
      return contact
    elsif attribute == 'last_name' && contact.last_name == value
      return contact
    elsif attribute == 'email' && contact.email == value
      return contact
    elsif attribute == 'note' && contact.note == value
      return contact
  end
end
end
  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end


  # Feel free to add other methods here, if you need them.

end
