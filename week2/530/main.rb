require'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?

def run_sql(sql)
	conn = PG.connect(:dbname => 'friend_list', :host => 'localhost')
	data = conn.exec(sql)
	conn.close
	data
end

get '/' do 
	@friends = run_sql("SELECT * FROM friend")
	erb :home
end

get '/new' do
	erb :new
end


get '/friends' do
	@friends = run_sql("SELECT * FROM friend")
	erb :friends
end


get '/friend/:id' do
	@friend = run_sql("SELECT * FROM friend WHERE id = #{params['id']}")[0]
	erb :friend
end

post '/create' do
	name = params[:name] 
	age = params[:age]
	gender = params[:gender]
	image_url = params[:image_url]
	twitter_url = params[:twitter_url]
	github_url = params[:github_url]
	facebook_url = params[:facebook_url]

	run_sql("INSERT INTO friend (name, age, gender, image_url, twitter_url, github_url, facebook_url) VALUES ('#{name}', #{age}, '#{gender}', '#{image_url}', '#{twitter_url}', '#{github_url}', '#{facebook_url}')")
	redirect to('/')
end


#create another method where you can delete a friend, utilizing 'DELETE FROM friend WHERE name is name'


