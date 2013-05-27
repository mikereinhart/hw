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

	#def pet_to_shelter(name)
	#	pets.pop(name)
	#	@animals << name
	#end

end

=begin
reconsider the structure here. for animal, make all the methods that affect 
an animal under the animal class. for instnace, adding an animal should be 
a method of animal, not of the client or the shelter.
=end

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
mike.add_pet(buck)
mike.add_pet(misty)
my_shelter.print_animals
my_shelter.print_clients
mike.print_pets




