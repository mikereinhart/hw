require 'pry'

class Shelter

	attr_accessor :name, :clients, :animals

	def initialize(name)
		@name = name
		@clients = []
		@animals = []
	end

	def add_client(name)
		client = Client.new(name)
		@clients << client
	end

	def add_animal(name)
		animal = Animal.new(name)
		@animals << animal
	end

	def print_clients
		puts 'Here is a list of our clients:'
		puts @clients.map { |cur| "#{cur.name}"}.join(', ')
	end

	def print_animals
		puts "These animals are available at HappiTails!"
		puts @animals.map { |cur| "#{cur.name}"}.join(', ')
	end
end



class Client

	attr_accessor :name, :pets

	def initialize(name)
		@name = name
		@pets = []
	end

	def add_pet(name)
		pet = Animal.new(name)
		@pets << pet
	end

	def print_pets
		puts "These animals belong to #{name}:"
		puts @pets.each { |cur| "#{cur.name}"}.join(', ')
	end

	def pet_to_shelter(name)
		pets.pop(name)
		@animals << name
	end

end



class Animal

	attr_accessor :name

	def initialize(name)
		@name = name
	end

end


my_shelter = Shelter.new('HappiTails')
mike = Client.new('Mike')
dave = Client.new('Dave')
pat = Client.new('Pat')
henry = Animal.new('Henry')
buck = Animal.new('Buck')
misty = Animal.new('Misty')

my_shelter.clients << mike
my_shelter.clients << dave
my_shelter.clients << pat
my_shelter.animals << buck
my_shelter.animals << misty
puts "Added Clients and Animals to HappiTails"
mike.add_pet(buck)
mike.add_pet(misty)
puts 'Added Buck and Misty to the client Mike.'
puts 'Here are the shelters animals:'
my_shelter.print_animals
puts 'Here are the shelters clients:'
my_shelter.print_clients
puts 'Heres Mike\'s pets:'
mike.print_pets
puts 'And now after trying to send a pet to the shelter:'
mike.pet_to_shelter(misty)
mike.print_pets



