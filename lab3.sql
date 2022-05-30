use Movie_Info;
-- 1.1 Display Movie_Name, IMDB_Rating of all movies according to the IMDB_Rating in descending order if multiple movies has
-- same IMDB_Rating then rearrange those movies alphabetically according to the Movie_Name

select Movie_Name, IMDB_Rating
from Movie
order by IMDB_Rating DESC, Movie_Name ASC;

-- 1.2 Find the total number of movies in the DB

select count(Movie_ID) total_movies
from Movie;

-- 1.3 Find how many of movie genres in the db

select count(distinct Genre)
from Movie;

-- 1.4 Find average IMDB_Rating of all movies of drama genre

select avg(IMDB_Rating) as avg_imdb_rating_of_drama
from Movie
where Genre = 'Drama';

-- 1.5 Find total number of movies in each genre

select Genre, count(Movie_ID) no_of_movies
from Movie
group by Genre;

-- 2.1 Find the name and current age of all actors and directors

select Actor_Name Name, year(now()) - Birth_Year age
from Actor
union
select Director_Name, year(now()) - Birth_Year
from Director;


-- 2.2 Find the name, birth year, number of awards as an actor as well as director
-- of those actors who directed at least one movie
-- /
-- of those directors who acted in at least one movie
select A.Actor_Name, A.Birth_Year, A.No_Of_Awards, D.No_Of_Awards
from Actor A,
     Director D
where A.Person_ID = D.Person_ID;

-- 2.3 Find the name, genre, imdb rating and name of the director of all movies directed by Satyajit Ray, Zahir Raihan,
-- Rituporno Ghosh, Kausik Ganguly

select M.Movie_Name, M.Genre, M.IMDB_Rating, D.Director_Name
from Movie M,
     Director D
where M.Director_ID = D.Person_ID
  and D.Director_Name in ('Saytajit Ray', 'Zahir Raihan', 'Rituparno Ghosh', 'Kaushik Ganguly');


-- 2.4 Find the number of movies directed by a director in average
select sum(D.No_Of_Films)/count(D.Person_ID) from Director D;

-- 2.5 Find the number of movies directed by a director ...
select D.Director_Name, count(D.Director_Name)
from Director D,
     Movie M
where D.Person_ID = M.Director_ID
group by D.Director_Name;