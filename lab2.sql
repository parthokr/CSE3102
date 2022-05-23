use Movie_Info;

-- 1.1 Find the name, genre, IMDB rating, and release year of all movies
select Movie_Name, Genre, IMDB_Rating, Year
from Movie;

-- 1.2 Display all the distinct movie genres
select distinct Genre
from Movie;

-- 1.3 Find the name and current age of all the actors
select Actor_Name, YEAR(NOW()) - Birth_Year Age
from Actor;

-- 1.4 Find the name, IMDB rating, and the name of the director of all movies
select M.Movie_Name, M.IMDB_Rating, D.Director_Name
from Movie M
         inner join Director D on M.Director_ID = D.Person_ID;

-- 1.5 Find the name, IMDB rating, release year, and the director name of all the movie of drama genre whose IMDB rating is gte to 8.0
select M.Movie_Name, M.IMDB_Rating, D.Director_Name
from Movie M
         inner join Director D on M.Director_ID = D.Person_ID
where M.Genre = 'Drama'
  and M.IMDB_Rating >= 8.0;

-- 1.6 Find the name and genre of all movies that contain an 'A' or 'J' as the first character of its name
select Movie_Name, Genre
from Movie
where Movie_Name like 'A%'
   or Movie_Name like 'J%';

-- 1.7 Find the name and the number of awards of those directors whose name contains an 'a' a its second character
select Director_Name, No_Of_Awards
from Director
where Director_Name like '_a%';

-- 1.8 Find the name, genre and the release year of all movies that contain the term 'Byomkesh' in anywhere in its name
select Movie_Name, Genre, Year
from Movie
where Movie_Name like '%Byomkesh%';

-- 1.9 Find the name and IMDB rating of those movies whose name consists of only 2 characters
select Movie_Name, IMDB_Rating
from Movie
where Movie_Name like '__';

-- 1.10 Find the name, genre and IMDB rating of all movies that contain at least 3 chars in its name
select Movie_Name, Genre, IMDB_Rating
from Movie
where Movie_Name like '___%';

-- 1.last Find the name, IMDB rating, and the name of the directors of all movies that contain at most 10 characters in its name
select M.Movie_Name, M.IMDB_Rating, D.Director_Name
from Movie M
         inner join Director D on M.Director_ID = D.Person_ID
where D.Director_Name not like '___________%';