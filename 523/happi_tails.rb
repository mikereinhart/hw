
class Shelter
  attr_accessor :name, :clients, :animals

  def initialize(name)
    @name = name
    @clients = []
    @animals = []
  end

  def add_client(client) #, age, sex)
    client = Client.new
    @clients << client


    #@name = name
    #@age = age
    #@sex = sex
    #@kids = []
    #@pets = []
  end

  def add_animal(animal) #, species, breed, age, sex)
    animal = Animal.new
    @animals << animal

    return name
  end
=begin
  def list_animals
    puts 'The following animals are up for adoption!'
    @animals.each do |animal|
      puts '#{animal.name}.capitalize the #{animal.sex} #{animal.species}.'
    end
  end
=end
end



class Client
  attr_accessor :name #, :age, :sex, :kids, :pets

  def initialize(name) #, age, sex)
    @name = name
    #@age = age
    #@sex = sex
    #@kids = []
    #@pets = []
  end
=begin
  def adopt(name)
    animal = Animal.new(name)
    @pets << animal
  end
=end
end



class Animal
  attr_accessor :name#, :species, :breed, :age, :sex, :fav_toy

  def initialize(name) #, species, breed, age, sex)
    @name = name
    #@species = species
    #@breed = breed
    #@age = age
    #@sex = sex
    #@fav_toy = []
  end
end

=begin
my_shelter = Shelter.new('HappiTails')
buck = Animal.new('Buck', 'Dog', 'Golden Retriever', 3, 'Male')
misty = Animal.new('Misty', 'Dog', 'Mutt', 12, 'Female')


buck.add_animal('Buck')
misty.add_animal('Misty')
my_shelter.list_animals
=end