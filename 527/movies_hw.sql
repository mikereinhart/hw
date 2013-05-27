CREATE TABLE movies
(
id SERIAL4 PRIMARY KEY,
title VARCHAR(50) NOT NULL,
released DATE,
rating VARCHAR(6),
runtime VARCHAR(15),
genre VARCHAR(40),
director VARCHAR(40),
writer VARCHAR(40),
actors VARCHAR(150),
plot VARCHAR(250),
type VARCHAR(20)
);
