def calc_duration(distance, mph)
	distance / mph
end

def calc_mpg(mph, mpg)
	if mph > 60
		 mpg -= ((mph-60)*2)
	else
		mpg
	end
end

def trip_cost(distance, mpg, cpg)
	gallons = distance/mpg
	gallons * cpg
end


puts "How many miles are you going?"
trip_distance = gets.chomp.to_f
puts "How fast are you going in MPH? "
trip_mph = gets.chomp.to_f
puts "What are your average miles per gallon (mpg)?"
average_mpg = gets.chomp.to_f
puts "What is cost per gallon?"
cost_per_gallon = gets.chomp.to_f

trip_time = calc_duration(trip_distance, trip_mph)
trip_mpg = calc_mpg(trip_mph,average_mpg)
trip_cost = trip_cost(trip_distance, trip_mpg, cost_per_gallon)

puts "Your trip will take #{trip_time} hours and cost #{trip_cost}"