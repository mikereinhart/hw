require 'pry'
require 'pg'
require 'json'
require 'httparty'

=begin
this opens out connection to SQL. we tell PostGres (PG) to 
connect to our database. the database name is 'movies' and 
it is hosted locally! Pretty logical. Note that conn is only
the logical name for a variable, it does not need to be conn.
but we are CONNecting to the database so it makes sense.
=end
conn = PG.connect(:dbname => 'movies', :host => 'localhost')



puts "\e[H\e[2J"
puts "======================================="
puts "=    Welcome to the WDI movie guide   ="
puts "======================================="
puts
print 'Movie title: '

=begin
This line takes the users input and assigns it to the variable 
'title'. .gsub takes all the spaces in the movies title (' ') 
and replaces them with a + ('+').eliminating the spaces between 
words in the movie title makes the title acceptable to the API.
=end

title = gets.chomp.capitalize.gsub(' ', '+')

=begin
the movie (one of our table outputs) is asigned to what JSON 
finds as the movie title using the API? Every other table metric 
is assign by taking a attribute of that movie. for instance, 
the year it was released is the movie['Year'], which is defined 
by the API and put into our database's table.
=end

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

=begin
here we have an spl_command, WHICH IS JUST THE VARIABLE. it is 
logically titled an SQL_command because we need to run it through SQL.
Hence the following command which is conn (which just means connect?) 
to SQL and EXECute sql_command.
=end

sql_command = "INSERT INTO movies (title, year, genre, director, rated, runtime, writer, imdbRating, type)
  VALUES ('#{title}', '#{year}', '#{genre}', '#{director}', '#{rated}', '#{runtime}', '#{writer}', '#{imdbrating}', '#{type}')"
conn.exec(sql_command)


#this prints out our user output. it takes the + we put into the title 
#earlier and replaces them wtih ' ' to return normal syntax.
puts "#{title} is now entered in your movie database!".gsub('+', ' ')
puts "Genre(s): #{genre}"
puts "Directed By: #{director}"
puts "Written By: #{writer}"

#THE FOLLOWING TWO COMMENTED LINES were our attempts to display the database. do we know how to do this yat?
#sql2_command ="\c movies \n SELECT * FROM movies"
#puts conn.exec(sql2_command)

=begin
Finally, this closes our connection to SQL. we are done running 
commands in SQL and therefore keep things neat and tidy by closing 
the connection.
=end
conn.close

=begin
The apostrophy issue:
gsub out an apostrophy with %27.
=end
