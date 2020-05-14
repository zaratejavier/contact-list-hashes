
@contact  = []

def mainMenu
  addSpace
  puts 'Menu'
  puts "1) Create Contact"
  puts "2) View Contacts"
  puts "3) Delete Contact"
  puts "4) Edit Contact"
  puts '5) Exit'
end  

def user_choice
  mainMenu
  input = gets.chomp
  case input
    when "1"
      addContact
    when "2"
      viewContacts
    when "3"
      removeContact
    when "4"
      editContact
    when "5"
      puts "--------- See ya later aligator --------"
      exit
    else
      puts "'#{input}' Is not valid! Try again please"
  end
  user_choice
end

def addContact
  new_user = {}
  puts "Enter first name"
  fname = gets.strip
  new_user[:name] = fname

  puts "Enter you phone number"
  number = gets.strip
  new_user[:phone] = number 

  @contact.push(new_user)
end

def viewContacts
  if @contact.length <= 0
      puts "There are no contacts yet"
  else
    puts "Here are all of your contacts: "
    @contact.each do |cont|
      puts "Name: #{cont[:name].split.map(&:capitalize).join(' ')}, Phone Number: #{cont[:phone]}"
    end
  end
end

def addSpace
  puts '-'* 20
  puts
end

def removeContact
  if @contact.length <= 0
    puts "There are no contacts to delete. Please enter a contact!"
  else
    @contact.pop
  end
end

def editContact
  puts "What contact would you like to change?"
  @contact.each_with_index do |cont, index|
    puts "#{index + 1}) #{cont[:name].split.map(&:capitalize).join(' ')}"
  end

  user_choice = gets.to_i
  puts "Alright you are going to edit #{@contact[user_choice - 1][:name].split.map(&:capitalize).join(' ')}"
  puts "What is your new contacts first name?"
  new_name = gets.strip

  puts "What is your new contacts phone number?"
  new_phone = gets.strip

  newContact = {:name => new_name, :phone => new_phone}
  @contact[user_choice - 1] = newContact
  puts @contact
  end  

user_choice













