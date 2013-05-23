def calc_duration(distance, mph)
	distance / mph
end

def calc_mpg(mph, mpg)
	if mph > 60
		mpg -= 2*(mph-60)
	else
		mpg
	end
end

def calc_cost(distance, mpg, cpg)
	gallons = distance / mpg
	cost = gallons * cpg
end

puts "How far are you going?"
trip_distance = gets.chomp.to_f
puts "In miles per hour (mph), how fast are you going?"
trip_mph = gets.chomp.to_f
puts "At 60 mph, what is your typical miles per gallon (mpg)?"
mpg_60 = gets.chomp.to_f
puts "How much do you pay for gas?"
cost_pg = gets.chomp.to_f

trip_time = calc_duration(trip_distance, trip_mph)
trip_mpg = calc_mpg(trip_mph, mpg_60)
trip_cost = calc_cost(trip_distance, trip_mph, cost_pg)

puts "Your trip will take #{trip_time.round(2)} hours and will cost $#{trip_cost.round(2)}."