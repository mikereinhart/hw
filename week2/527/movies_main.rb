require 'pry'
require 'pg'
require 'json'
require 'httparty'


conn = PG.connect(:dbname => 'movies', :host => 'localhost')



puts "\e[H\e[2J"
puts "======================================="
puts "=    Welcome to the WDI movie guide   ="
puts "======================================="
puts
print 'Movie title: '
title = gets.chomp.capitalize.gsub(' ', '+')

movie = JSON(HTTParty.get("http://www.omdbapi.com/?t=#{title}"))
year = movie['Year']
genre = movie['Genre']
director = movie['Director']
runtime = movie['Runtime']
writer = movie['Writer']
imdbrating = movie['imdbRating']
# release = movie['Release']
type = movie['Type']
rated = movie['Rated']

sql_command = "INSERT INTO movies (title, year, genre, director, rated, runtime, writer, imdbRating, type)
  VALUES ('#{title}', '#{year}', '#{genre}', '#{director}', '#{rated}', '#{runtime}', '#{writer}', '#{imdbrating}', '#{type}')"
conn.exec(sql_command)
conn.close

puts "#{title} is now entered in your movie database!".gsub('+', ' ')