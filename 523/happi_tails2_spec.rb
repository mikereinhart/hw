require_relative "happi_tails2"

=begin
HappiTails Animal Shelter

Required Functions:

Create an animal shelter. DONE

Manage Clients:
Clients can be added to shelter. DONE
Track name, age, sex, kids, and pets.
Client can put one of their pets up for adoption.
Client can adopt a pet from the shelter.
Be able to list all clients. DONE

Manage Animals:
Animals can be added to the shelter. DONE
Track names, breed, age, sex, and fav toys. 
List animals in the shelter (up for adoption). DONE
=end




describe Shelter do
	describe '#new_shelter' do
		it 'builds a new Shelter' do
			my_shelter = Shelter.new('HappiTails')
			my_shelter.should be_instance_of Shelter
			my_shelter.name.should == 'HappiTails'
		end
	end

	describe '#add_client' do 
		it 'adds a new client to the shelter' do
			my_shelter = Shelter.new('HappiTails')
			new_client = my_shelter.add_client('Mike')
			my_shelter.clients == 1
		end
	end

	describe '#list_clients' do
		it 'displays clients up for adoption' do
			my_shelter = Shelter.new('HappiTails')
			new_client = my_shelter.add_client('Mike')
			new_client = my_shelter.add_client('Dave')
			my_shelter.clients == 2
			puts my_shelter.clients
		end
	end

	describe '#add_animal' do
		it 'adds a new animal to the shelter' do
			my_shelter = Shelter.new('HappiTails')
			new_animal = my_shelter.add_animal('Buck')
			my_shelter.animals == 1
		end
	end

	describe '#list_animals' do
		it 'displays animals up for adoption' do
			my_shelter = Shelter.new('HappiTails')
			new_animal = my_shelter.add_animal('Buck')
			new_animal = my_shelter.add_animal('Misty')
			my_shelter.animals == 2
			puts my_shelter.animals
		end
	end

end



describe Client do
	describe '#new_client' do
		it 'makes a new client' do
			client = Client.new('Mike')
			client.should be_instance_of Client
			client.name.should == 'Mike'
		end
	end

	describe '#add_pet' do
		it 'adds a new pet to the client' do
			client = Client.new('Mike')
			new_pet = client.add_pet('Buck')
			client.pets == 1
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
			animal = Animal.new('Buck')
			animal.should be_instance_of Animal
			animal.name.should == 'Buck'
		end
	end

end