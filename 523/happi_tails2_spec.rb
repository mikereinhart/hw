require_relative "happi_tails2"

=begin
HappiTails Animal Shelter

Required Functions:

Create an animal shelter. DONE

Manage Clients:
Clients can be added to shelter. DONE
Track name, age, sex, kids, and pets. DONE.
Client can put one of their pets up for adoption.
Client can adopt a pet from the shelter.
Be able to list all clients. DONE

Manage Animals:
Animals can be added to the shelter. DONE
Track names, breed, age, sex, and fav toys. DONE.
List animals in the shelter (up for adoption). DONE
=end

describe Shelter do
  describe '#new' do
    it 'builds a new Shelter' do
      my_shelter = Shelter.new('HappiTails')
      my_shelter.should be_instance_of Shelter
      my_shelter.name.should == 'HappiTails'
    end
  end

  describe '#add_client' do
    let(:shelter) { Shelter.new('HappiTails') }
    let(:client) { Client.new('Mike', 24, 'Male', 3) }

    it 'adds a new client to the shelter' do
      shelter.clients == 1
    end

    it 'allows the shelter to have multiple clients' do
      new_client = Client.new('Dave', 62, 'Male', 2)
      shelter.clients == 2
    end
  end

  describe '#print_clients' do
    it 'displays clients of the shelter' do
      my_shelter = Shelter.new('HappiTails')
      new_client = my_shelter.add_client('Mike', 24, 'Male', 3)
      new_client = my_shelter.add_client('Dave', 62, 'Male', 2)
      my_shelter.clients == 2
      puts my_shelter.clients
    end
  end

  describe '#add_animal' do
    it 'adds a new animal to the shelter' do
      my_shelter = Shelter.new('HappiTails')
      new_animal = my_shelter.add_animal('Buck', 'Golden', 4, 'Male')
      my_shelter.animals == 1
    end
  end

  describe '#print_animals' do
    it 'displays animals up for adoption' do
      my_shelter = Shelter.new('HappiTails')
      new_animal = my_shelter.add_animal('Buck', 'Golden', 4, 'Male')
      new_animal = my_shelter.add_animal('Misty', 'Mutt', 12, 'Female')
      my_shelter.animals == 2
      puts my_shelter.animals
    end
  end

end



describe Client do
  describe '#new' do
    it 'makes a new client' do
      client = Client.new('Mike', 24, 'Male', 3)
      client.should be_instance_of Client
      client.name.should == 'Mike'
      client.age.should == 24
      client.sex.should == 'Male'
      client.kids.should == 3
    end
  end

  describe '#add_pet' do
    it 'adds a new pet to the client' do
      client = Client.new('Mike', 24, 'Male', 3)
      new_pet = client.add_pet('Buck', 'Golden', 4, 'Male')
      client.pets == 1
    end
  end

  describe '#print_pets' do
    it 'prints out a list of the client\'s pets' do
      client = Client.new('Mike', 24, 'Male', 3)
      pet_1 = client.add_pet('Buck', 'Golden', 4, 'Male')
      pet_2 = client.add_pet('Misty', 'Mutt', 12, 'Female')
      puts client.pets
    end
  end
=begin
	describe '#pet_to_shelter' do
		it 'removes pet and adds it to the shelter' do
			my_shelter = Shelter.new('HappiTails')
			client = Client.new('Mike')
			new_pet = client.add_pet('Buck')
			client.pet_to_shelter('Buck')
			client.pets.should == 0
			my_shelter.animals.should == 1
		end
	end
=end
end



describe Animal do
  describe '#new_animal' do
    it 'makes a new animal' do
      animal = Animal.new('Buck', 'Golden', 4, 'Male')
      animal.should be_instance_of Animal
      animal.name.should == 'Buck'
      animal.breed.should == 'Golden'
      animal.age.should == 4
      animal.sex.should == 'Male'
    end
  end

end
