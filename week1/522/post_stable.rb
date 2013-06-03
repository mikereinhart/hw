require_relative "convert_num_to_station.rb"
require "pry"

#line identifiers:
#n line = 1
#l line = 2
#six line = 6

#array = city wide value, line specific value, station name, line identifier

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
	index_of_stops(subway_stops)
	puts "#{flag} - #{subway_stops[key][3]} at #{subway_stops[key][2]}"
	flag += 1
end

binding.pry

choice = gets.chomp.to_i
convert_num_to_station(choice)
#location_on = 
case choice
	when 1
		location_on = :tsq_n
	when 2
		location_on = :th34_n
	when 3
		location_on = :th28_n
	when 4
		location_on = :rd23_n
	when 5
		location_on = :unsq_n
	when 6
		location_on = :th28_n
	when 7
		location_on = :th8_l
	when 8
		location_on = :th6_l
	when 9
		location_on = :unsq_l
	when 10
		location_on = :rd3_l
	when 11
		location_on = :st1_1
	when 12
		location_on = :gcs_six
	when 13
		location_on = :rd33_six
	when 14
		location_on = :th28_six
	when 15
		location_on = :rd23_six
	when 16
		location_on = :unsq_six
	when 17
		location_on = :aspl_six
end

puts "Where are you getting off the subway?"
location_off = gets.chomp.to_i
#index_of_stops(location_off)
case location_off
	when 1
		location_off = :tsq_n
	when 2
		location_off = :th34_n
	when 3
		location_off = :th28_n
	when 4
		location_off = :rd23_n
	when 5
		location_off = :unsq_n
	when 6
		location_off = :th28_n
	when 7
		location_off = :th8_l
	when 8
		location_off = :th6_l
	when 9
		location_off = :unsq_l
	when 10
		location_off = :rd3_l
	when 11
		location_off = :st1_1
	when 12
		location_off = :gcs_six
	when 13
		location_off = :rd33_six
	when 14
		location_off = :th28_six
	when 15
		location_off = :rd23_six
	when 16
		location_off = :unsq_six
	when 17
		location_off = :aspl_six
end

#binding.pry
if subway_stops[location_on][3] == subway_stops[location_off][3]
	number_of_stops = (subway_stops[location_on][1] - subway_stops[location_off][1]).abs
else
	number_of_stops = subway_stops[location_on][0] + subway_stops[location_off][0]
end


puts "You will be traveling #{number_of_stops} stops."


