
#line identifiers:
#n line = 1
#l line = 2
#six line = 6

#array = city wide value, line specific value, station name, line identifier

require_relative "stops_index.rb"

subway_stops = { tsq_n: [4, 1, "Times Square", "N Line"],
				 th34_n: [3, 2, "34th St", "N Line"], 
				 th28_n: [2, 3, "28th St", "N Line"], 
				 rd23_n: [1, 4, "23rd St", "N Line"], 
				 unsq_n: [0, 5, "Union Square", "N Line"], 
				 th8_n: [1, 6, "8th Ave", "N Line"], 

				th8_l: [2, 1, "8th Ave", "L Line"], 
				th6_l: [1, 2, "6th Ave", "L Line"], 
				unsq_l: [0, 3, "Union Square", "L Line"], 
				rd3_l: [1, 4, "3rd Ave", "L Line"], 
				st1_l: [2, 5, "1st Ave", "L Line"], 

				gcs_six: [4, 1, "Grand Central", "6 Line"], 
				rd33_six: [3, 2, "33rd St", "6 Line"], 
				th28_six: [2, 3, "28th St", "6 Line"], 
				rd23_six: [1, 4, "23rd St", "6 Line"], 
				unsq_six: [0, 5, "Union Square", "6 Line"], 
				aspl_six: [1, 6, "Astor Place", "6 Line"] }

puts "Where are you getting on the subway?"

flag = 1
subway_stops.each do |key, value|
	convert_num_to_station(subway_stops)
	puts "#{flag} - #{subway_stops[key][3]} at #{subway_stops[key][2]}"
	flag += 1
end
location_on = gets.chomp.to_i
convert_num_to_station(location_on)

#binding.pry

puts "Where are you getting off the subway?"
location_off = gets.chomp.to_i
convert_num_to_station(location_off)
	
if subway_stops[location_on][3] == subway_stops[location_off][3]
	number_of_stops = (subway_stops[location_on][1] - subway_stops[location_off][1]).abs
else
	number_of_stops = subway_stops[location_on][0] + subway_stops[location_off][0]
end


puts "You will be traveling #{number_of_stops} stops."


