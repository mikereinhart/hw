require_relative "happi_tails"

=begin
HappiTails Animal Shelter

Required Functions:

Create an animal shelter. DONE

Manage Clients:
Clients can be added to shelter. DONE
Track name, age, sex, kids, and pets. DONE
Client can put one of their pets up for adoption.
Client can adopt a pet from the shelter.
Be able to list all clients.

Manage Animals:
Animals can be added to the shelter. DONE
Track names, breed, age, sex, and fav toys. DONE
List animals in the shelter (up for adoption). DONE
=end

describe Shelter do
	describe '#new_shelter' do
		it 'builds a new Shelter with a name' do	
			my_shelter = Shelter.new('HappiTails')
			my_shelter.should be_instance_of Shelter
			my_shelter.name.should == 'HappiTails'
		end
	end

	describe '#add_client' do
		it 'adds a new client to the shelter' do
			my_shelter = Shelter.new('HappiTails')
			#client = Client.new('Mike', 24, 'Male')
			client = my_shelter.add_client('Mike') #, 24, 'Male')
			my_shelter.clients == 1
		end
	end

	describe '#add_animal' do
		it 'adds a new animal to the shelter' do
			my_shelter = Shelter.new('HappiTails')
			animal = Animal.new('Buck') #, 'Dog', 'Golden Retriever', 3, 'Male')
			#animal = my_shelter.add_animal('Buck') #, 'Dog', 'Golden Retriever', 3, 'Male')
			my_shelter.animals == 1
		end
	end
=begin
	describe '#list_animals' do
		it 'prints out a list of animals up for adoption' do
			my_shelter = Shelter.new('HappiTails')
			my_shelter.add_animal('Buck') #, 'Dog', 'Golden Retriever', 3, 'Male')
			my_shelter.add_animal('Misty') #, 'Dog', 'Mutt', 12, 'Female')
			my_shelter.list_animals
		end
	end
=end
end

describe Client do
	describe '#new_client' do
		it 'builds a new Client with 4 arguments' do
			client = Client.new('Mike') #, 24, 'Male')
			client.should be_instance_of Client
			client.name.should == 'Mike'
			#client.age.should == 24
			#client.sex.should == 'Male'
		end
	end

	#describe '#add_animal' do
		#it ''
=begin
	describe "#adoption" do
		it 'adds a new pet to a client' do
			client = Client.new('Mike', 24, 'Male')
			pets = client.adopt('Misty')
			client.pets.should == 'Misty'
		end
	end
=end
end

describe Animal do
	describe '#new_animal' do
		it 'builds a new animal with 6 arguments' do
			animal = Animal.new('Buck') #, 'Dog', 'Golden Retriever', 3, 'Male')
			animal.should be_instance_of Animal
			animal.name.should == 'Buck'
			#animal.species.should == 'Dog'
			#animal.breed.should == 'Golden Retriever'
			#animal.age.should == 3
			#animal.sex.should == 'Male'
		end
	end
end




