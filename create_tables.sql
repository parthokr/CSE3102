create database Movie_Info;

use Movie_Info;

create table Director(
  Person_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Director_Name VARCHAR(25) NOT NULL,
  Birth_Year DECIMAL(4, 0) NOT NULL,
  No_Of_Films INT NOT NULL,
  No_Of_Awards INT NOT NULL
);


create table Actor(
    Person_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Actor_Name VARCHAR(25) NOT NULL,
    Birth_Year DECIMAL(4) NOT NULL,
    No_Of_Films INT NOT NULL,
    No_Of_Awards INT NOT NULL
);

create table Movie(
    Movie_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Movie_Name VARCHAR(55) NOT NULL,
    Genre VARCHAR(25) NOT NULL,
    Year DECIMAL(4) NOT NULL,
    IMDB_Rating DECIMAL(2, 1),
    Director_ID INT,
    FOREIGN KEY (Director_ID) REFERENCES Director(Person_ID)
);

