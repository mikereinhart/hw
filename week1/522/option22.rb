require_relative "stops_index.rb"

#HOMEWORK

#The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip. 

#There are 3 subway lines:
#the N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
#The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
#the 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place

#All 3 subway lines intersect at Union Square, but there are no other intersection points (for example, this means the 28th stop on the N line is different than the 28th stop on the 6 line.)

#Bonus: write tests for it. Focus test on the logic, not on the IO.


#n_line = {tsq_n: [4, "Times Square"], th34_n: [3, "34th St"], th28_n: [2, "28th St"], rd23_n: [1, "23rd St"], unsq_n: [0, "Union Square"], th8_n: [1, "8th Ave"]}
#l_line = {th8_l: [2, "8th Ave"], th6_l: [1, "6th Ave"], unsq_l: [0, "Union Square"], rd3_l: [1, "3rd Ave"], st1_l: [2, "1st Ave"]}
#six_line = {gs_six: [4, "Grand Central"], rd33_six: [3, "33rd St"], th28_six: [2, "28th St"], rd23_six: [1, "23rd St"], unsq_six: [0, "Union Square"], aspl_six: [1, "Astor Place"]}

#line identifiers:
#n line = 1
#l line = 2
#six line = 6

#array = city wide value, line specific value, station name, line identifier
require "pry"

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
choice = gets.chomp.to_i
index_of_stops(choice)
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


