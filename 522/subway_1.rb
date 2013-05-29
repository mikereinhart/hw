
subway_lines = ["n", "l", "six"]

#Subway line arrays.
n = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
l = ["8th", "6th", "Union Square", "3rd", "1st"]
six = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]

#Get train and stop the user enters subway
puts "What line are you getting on at: the (N) line, the (L) line, or the (six) line?"
line_on = gets.chomp.to_s.downcase

while !['n','l','six'].include? line_on
	puts "Please enter a valid subway line!"
	puts "What line are you getting on at: the (N) line, the (L) line, or the (six) line?"
	line_on = gets.chomp.to_s.downcase
end

case line_on
	when 'n'
		puts "Are you getting on at (T)imes Square, (34)th, (28)th, (23)rd, (U)nion Square, or (8)th?:"
		stop_on = gets.chomp.to_s.downcase

	when 'l'
		puts "Are you getting on at (8)th, (6)th, (U)nion Square, (3)rd, (1)st?:"
		stop_on = gets.chomp.to_s.downcase
	when 'six'
		puts "Are you getting on at (G)rand Central, (33)rd, (28)th, (23)rd, (U)nion Square, or (A)stor Place?:"
		stop_on = gets.chomp.to_s.downcase
	end

#Get train and stop the user exits subway
puts "What line are you getting off at: the (N) line, the (L) line, or the (six) line?"
line_off = gets.chomp.to_s.downcase

while !['n','l','six'].include? line_off
	puts "Please enter a valid subway line!"
	puts "What line are you getting off at: the (N) line, the (L) line, or the (six) line?"
	line_off = gets.chomp.to_s.downcase
end

case line_off
	when 'n'
		puts "Are you getting on at (T)imes Square, (34)th, (28)th, (23)rd, (U)nion Square, or (8)th?:"
		stop_off = gets.chomp.to_s.downcase

	when 'l'
		puts "Are you getting on at (8)th, (6)th, (U)nion Square, (3)rd, (1)st?:"
		stop_off = gets.chomp.to_s.downcase
	when 'six'
		puts "Are you getting on at (G)rand Central, (33)rd, (28)th, (23)rd, (U)nion Square, or (A)stor Place?:"
		stop_off = gets.chomp.to_s.downcase
	end

puts "You are getting on the #{line_on.capitalize} train at the #{stop_on} stop. You are getting off on the #{line_off.capitalize} train at the #{stop_off} stop."

#Calculate distance Traveled
when line_on == line_off
	if line_on == 'n'
		stops_traveled = n[stop_on] - n[stop_off]
	elsif line_on == 'l'
		stops_traveled = l[stop]


