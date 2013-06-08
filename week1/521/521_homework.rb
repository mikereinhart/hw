def duration
	puts "How far are you going?"
	@distance = gets.chomp.to_f
	puts "In miles per hour (mph), how fast are you going?"
	@mph = gets.chomp.to_f
	@duration = @distance / @mph
end

def mpg
	puts "At 60 mph, what is your typical miles per gallon (mpg)?"
	@mpg_60 = gets.chomp.to_f
	if @mph > 60
		@mpg = @mpg_60 - ((@mph-60)2)
	else
		@mpg_60 = @mpg
	end
end

def cost
	puts "How much do you pay for gas?"
	@cost_pg = gets.chomp.to_f
	@gallons = @distance / @mpg
	@cost = @gallons * cost_pg
end

#do math in minutes, then convert to hours for solution?





@duration = "#{@distance/@mph}"

	@mpg_60 = @distance / @gallons
	if @mpg