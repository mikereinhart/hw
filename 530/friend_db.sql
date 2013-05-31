CREATE TABLE friend(
	id SERIAL4 PRIMARY KEY,
	name TEXT NOT NULL,
	age INT4, 
	gender TEXT,
	image_url TEXT,
	twitter_url TEXT,
	github_url TEXT,
	facebook_url TEXT
);