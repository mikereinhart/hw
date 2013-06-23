require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'

=begin
- user can add a new video on homepage: DONE
- user can edit videos: DONE
- user can delete videos: DONE
- user can show only videos of a certain genre:	
=end

get '/' do 
	erb :home
end

post '/create' do
	sql = "INSERT INTO videos (title, description, url, genre) VALUES ('#{params['title']}', '#{params['description']}', '#{params['url']}', '#{params['genre']}')"
	run_sql(sql)
	redirect to('/videos')
end

get '/videos' do
	sql = 'SELECT * FROM videos'
	@rows = run_sql(sql)
	erb :videos
end

get '/videos/:id/edit/' do
	sql = "SELECT * FROM videos WHERE id = #{params['id']}"
	rows = run_sql(sql)
	@row = rows.first

	erb :edit
end

post '/videos/:id/' do
	sql = "UPDATE videos SET title='#{params['title']}', description='#{params['description']}', url='#{params['url']}', genre='#{params['genre']}' WHERE id='#{params['id']}' "
	run_sql(sql)
	redirect to('/videos')
end

post '/videos/:id/delete/' do
	sql = "DELETE FROM videos WHERE id = #{params['id']}"
	run_sql(sql)
	redirect to('/videos')
end

get 'videos/:genre/' do
	sql = "SELECT * FROM videos WHERE genre = #{params['genre']}"
	rows = run_sql(sql)
	@row = rows.first

	erb :genre
end

def run_sql(sql)
	conn = PG.connect(dbname: 'video_store', host: 'localhost')
	result = conn.exec(sql)
	conn.close
	result
end
