CREATE TABLE movies
(
	id SERIAL8 PRIMARY KEY 
	title VARCHAR(200) NOT NULL,
	year INT2,
	genre VARCHAR(200),
	director VARCHAR(200),
	rated VARCHAR(200),
	runtime VARCHAR(200),
	writer VARCHAR(200),
	imdbRating VARCHAR(200),
	release DATE,
	type VARCHAR(200)
);