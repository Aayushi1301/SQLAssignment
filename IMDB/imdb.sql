CREATE DATABASE IMDB ;
USE IMDB ;

CREATE TABLE IF NOT EXISTS actors (
actors_id INT NOT NULL,
actors_name VARCHAR(45) ,
actors_age VARCHAR(45) ,
actors_gender VARCHAR(7) ,
PRIMARY KEY (actors_id),
COMMENT='Strong entity');


CREATE TABLE IF NOT EXISTS movie (
movie_id INT NOT NULL,
movie_name VARCHAR(45) NOT NULL,
movie_description VARCHAR(45),
movie_rating FLOAT ,
actor_id INT ,
PRIMARY KEY (movie_id),
FOREIGN KEY (actor_id)
REFERENCES actors (actors_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
COMMENT='Weak entity');


CREATE TABLE IF NOT EXISTS TVseries (
TVseries_id INT NOT NULL,
TVseries_name VARCHAR(45) NOT NULL,
TVseries_description VARCHAR(45) ,
TVseries_rating FLOAT ,
actor_id INT ,
PRIMARY KEY (TVseries_id),
FOREIGN KEY (actor_id)
REFERENCES actors (actors_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
COMMENT='Weak entity');


