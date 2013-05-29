n = ["Times Square" "34th" "28th" "23rd" "Union Square" "8th"]
l = ["8th", "6th", "Union Square", "3rd", "1st"]
six = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]

puts "What line are you getting on at: the (N) line, the (L) line, or the (6) line?"
line_on = gets.chomp!.to_s.downcase

case line_on
when line_on == 'n'
	"Are you getting on at (T)imes Square, (34)th, (28)th, (23)rd, (U)nion Square, or (8)th?"
	stop_on = gets.chomp!.to_s.downcase

when line_on == 'l'
	"Are you getting on at (8)th, (6)th, (U)nion Square, (3)rd, (1)st?"
	stop_on = gets.chomp!.to_s.downcase

when line_on == 'six'
	"Are you getting on at (G)rand Central, (33)rd, (28)th, (23)rd, (U)nion Square, or (A)stor Place?"
	stop_on = gets.chomp!.to_s.downcase

puts "You are getting on the #{line_on} train at the #{stop_on} stop."



