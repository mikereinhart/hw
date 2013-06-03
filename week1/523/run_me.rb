require_relative "classes.rb"

#Sample Client, Animal, and Shelter Info
clients [
	client_one = Client.new("ClientOne", 34, "M", 0),
	client_two = Client.new("ClientTwo", 24, "M", 0),
	client_three = Client.new("ClientThree", 40, "F", 2),
	client_four = Client.new("ClientFour", 20, "M", 5),
	client_five = Client.new("ClientFive", 29, "F", 1)
]

#animal_one = Animal.new('Fido', "Dog", "Golden Retriever", 1, "Male", "Ball")
#animal_two = Animal.new('Lassy', "Dog", "Golden Retriever", 2, "Male", "Boy in the Well")
#animal_three = Animal.new('Misty', "Cat", "Cat?", 7, "Female", "String")
#animal_four = Animal.new('Henry', "Fish", "Goldfish", 1, "Male", "Water")

#my_shelter = Shelter.new('My Shelter')


#Main Menu
puts "Main Menu. You can:\n 1: List Clients \n 2: List Animals \n 3: Add a Client \n 4: Add an Animal"

mm_choice = gets.chomp.to_i

case mm_choice
	when 1
		client_names
end
