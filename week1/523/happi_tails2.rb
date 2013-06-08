require 'pry'

class Shelter

	attr_accessor :name, :clients, :animals

	def initialize(name)
		@name = name
		@clients = []
		@animals = []
	end

	def add_client(name, age, sex, kids)
		client = Client.new(name, age, sex, kids)
		@clients << client
	end

	def add_animal(name, breed, age, sex)
		animal = Animal.new(name, breed, age, sex)
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

	def adopt(name)
		@animals.pop(name)
		client.pets << animal
	end

	def get_animal(pet_name, client)
		client.pets.pop(pet_name)
		@animals << pet_name
	end

end



class Client

	attr_accessor :name, :age, :sex, :kids, :pets

	def initialize(name, age, sex, kids, pets_list = [])
		#petS_lists starting as an empty array is a dafault value.
		#if it not assigned, it defaults to an empty array.
		@name = name
		@age = age
		@sex = sex
		@kids = kids
		@pets = pets_list
	end

	def add_pet(name, breed, age, sex)
		pet = Animal.new(name, breed, age, sex)
		@pets << pet
	end

	def print_pets
		puts "These animals belong to #{name}:"
		puts @pets.each { |cur| "#{cur.name}"}.join(', ')
	end

	def pet_to_shelter(name, shelter)
		pets.pop(name )
		@animals << name
	end

	def adopt_pet(name)

	end

end



class Animal

	attr_accessor :name, :breed, :age, :sex, :fav_toys

	def initialize(name, breed, age, sex)
		@name = name
		@breed = breed
		@age = age
		@sex = sex
		fav_toys = []
	end

end


my_shelter = Shelter.new('HappiTails')
mike = Client.new('Mike', 24, 'Male', 3)
dave = Client.new('Dave', 62, 'Male', 2)
pat = Client.new('Pat', 63, 'Female', 2)
henry = Animal.new('Henry', 'Fish', 1, 'Male')
buck = Animal.new('Buck', 'Golden', 4, 'Male')
misty = Animal.new('Misty', 'Mutt', 12, 'Male')

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


