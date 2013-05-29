
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

#n line = 1
#l line = 2
#six line = 6
#array = city wide value, line specific value, station name, line identifier

subway_stops = { tsq_n: [4, 1, "Times Square", 1], th34_n: [3, 2, "34th St", 1], th28_n: [2, 3, "28th St", 1], rd23_n: [1, 4, "23rd St", 1], unsq_n: [0, 5, "Union Square", 1], th8_n: [1, 6, "8th Ave", 1], 
	th8_l: [2, 1, "8th Ave", 2], th6_l: [1, 2, "6th Ave", 2], unsq_l: [0, 3, "Union Square", 2], rd3_l: [1, 4, "3rd Ave", 2], st1_l: [2, 5, "1st Ave", 2], 
	gcs_six: [4, 1, "Grand Central", 6], rd33_six: [3, 2, "33rd St", 6], th28_six: [2, 3, "28th St", 6], rd23_six: [1, 4, "23rd St", 6], unsq_six: [0, 5, "Union Square", 6], aspl_six: [1, 6, "Astor Place", 6] }

puts "Where are you getting on the subway?"
location_on = gets.chomp
location_on = :tsq_n

puts "Where are you getting off the subway?"
location_off = gets.chomp
location_off = :th8_n

if subway_stops[location_on][3] == subway_stops[location_off][3]
	number_of_stops = (subway_stops[location_on][1] - subway_stops[location_off][1]).abs
else
	number_of_stops = subway_stops[location_on][0] + subway_stops[location_off][0]
end





number_of_stops = subway_stops[location_on][0] + subway_stops[location_off][0]
puts "You will be traveling #{number_of_stops} stops."