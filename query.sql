use Movie_Info;
-- select all movie names, genre and imbd rating
select Movie_Name, Genre, IMDB_Rating
from Movie;
-- select all movies with unique genre
select distinct Genre
from Movie;
-- select all movie names, imbd rating where genre is Drama and imbd rating is greater than 8.0 (inclusive)
select Movie_Name, IMDB_Rating
from Movie
where Genre = 'Drama'
  and IMDB_Rating >= 8.0;

-- select all actor names, and ages
select Actor.Actor_Name, YEAR(NOW()) - Birth_Year age
from Actor;

-- select all movie name, imdb rating and corresponding director name
select Movie_Name, IMDB_Rating, D.Director_Name
from Movie
         inner join Director D on Movie.Director_ID = D.Person_ID
where Genre = 'Thriller';

-- select movies that starts with A
select Movie_Name, Genre
from Movie
WHERE Movie_Name like 'A%';

-- select directors who have a at the second position from the start (1 based)
select Director_Name, No_Of_Awards
from Director
where Director_Name like '_a%';

-- --------------------------------

-- practice

-- count example
select count(IMDB_Rating)
from Movie
where IMDB_Rating >= 8;

/*
    merging two tables without common column
    this generates cartesian product
    also known as self join
*/
select M.Movie_Name, D.Director_Name
from Movie M,
     Director D;

-- one useful case of self join is to identify records with identical column value
-- eg, fetch the records of movies that have same imbd ratings

select M1.Movie_Name, M2.IMDB_Rating
from Movie M1,
     Movie M2
WHERE M1.Movie_ID <> M2.Movie_ID
  AND M1.IMDB_Rating = M2.IMDB_Rating
order by M1.IMDB_Rating;

-- left join to fetch rows that are common as well as uncommon
select M.Movie_Name, D.Director_Name
from Movie M
         left join Director D on D.Person_ID = m.Director_ID;

-- modify previous example to replace null with a more legible and meaningful message
select M.Movie_Name, IFNULL(D.Director_Name, 'Not available') Directtor_Name
from Movie M
         left join Director D on D.Person_ID = m.Director_ID;

-- union Director and Actor table, precisely persons who are either director or actor or both

select D.Director_Name
from Director D
union
select A.Actor_Name
from Actor A;

-- intersect Director and Actor table, precisely persons who are both director and actor
select D.Director_Name from Director D intersect select A.Actor_Name from Actor A;

-- if else example
select M.Movie_Name, M.IMDB_Rating, if(M.IMDB_Rating >= 8, 'Excellent', 'May be moderate')
from Movie M;

-- improved if else
select M.Movie_Name, M.IMDB_Rating, if(M.IMDB_Rating >= 7, if(M.IMDB_Rating >= 8, 'Excellent', 'Moderate'), 'Not so good')
from Movie M;

-- case example
-- why case? because by using if else we can only handle 2 cases with ease, but case makes this freaking easier
select M.Movie_Name, M.IMDB_Rating,
case
    when M.IMDB_Rating <=7 then 'Not so good'
    when M.IMDB_Rating <= 8 then 'Moderate'
    when M.IMDB_Rating <=10 then 'Excellent'
end as review
from Movie M;