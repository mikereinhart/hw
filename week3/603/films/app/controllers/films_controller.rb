class FilmsController <ApplicationController
	def index
		@films = Film.all 
	end

	def new
		@film = Film.new
	end

	def create
		@film = Film.new(params[:film])
		@film.save!
		redirect_to films_path
	end

	def edit
		@film = Film.find(params[:id])
	end

	def update
		film = Film.find(params[:id])
		film.update_attributes(params[:film])
		redirect_to films_path
	end

	def destroy
		film = Film.find(params[:id])
		film.delete
		redirect_to films_path
	end
end


=begin
Our rails project must:
show all movies in db: DONE
add new movies to DB: DONE
edit movies in DB: DONE
delete movies from db: DONE
=end