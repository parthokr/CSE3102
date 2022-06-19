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

-- 1.1 Display the name, IMDB rating and genre of all the movies with an IMDB rating gte to 8.0
select Movie_Name, IMDB_Rating, Genre from Movie where IMDB_Rating >= 8.0;

-- 1.2 Find how many movies are there in each genre with an IMDB rating gte to 8.0
select M.Genre, count(M.Movie_ID) no_of_movies
    from Movie M
        where M.IMDB_Rating >= 8.0
            group by Genre;

-- 1.3 Find the name and average IMDB rating of those genres whose average IMDB rating is gte to 7.5
select M.Genre, avg(M.IMDB_Rating) avg
    from Movie M
        group by Genre
            having avg(M.IMDB_Rating) >= 7.5;

-- 1.4 Find the name, number of films, number of awards of the director who directed most of the movies
select D.Director_Name, D.No_Of_Films, D.No_Of_Awards
    from Director D
        where D.No_Of_Films=(select max(D1.No_Of_Films) from Director D1);

-- 1.5 Find the name, current age, number of films and number of awards of the youngest actor
select A.Actor_Name, YEAR(CURDATE()) - A.Birth_Year as age, A.No_Of_Films
    from Actor A
        where A.Birth_Year=(select max(A1.Birth_Year) from Actor A1);

-- 2.1 Find the name, nfd, nfa, nad, naa of all the directors
select D.Director_Name, D.No_Of_Films nfd, A.No_Of_Films nfa, D.No_Of_Awards nad, A.No_Of_Awards naa
    from Director D
        left join Actor A on A.Person_ID = D.Person_ID;

-- 2.2 Find the name, nfd, nfa, nad, naa of all the actors and directors
select D.Director_Name Name, D.No_Of_Films nfd, A.No_Of_Films nfa, D.No_Of_Awards nad, A.No_Of_Awards naa
    from Director D
        left join Actor A on A.Person_ID = D.Person_ID
union
select A.Actor_Name Name, D.No_Of_Films nfd, A.No_Of_Films nfa, D.No_Of_Awards nad, A.No_Of_Awards naa
    from Actor A
        left join Director D on A.Person_ID = D.Person_ID;

-- 2.3 Find the name, nf, na of those actors who never directed any film
select A.Actor_Name, A.No_Of_Films, A.No_Of_Awards
    from Actor A
        left join Director D on D.Person_ID = A.Person_ID
            where D.Director_Name is null;

-- 2.4 Find name, IMDB rating, genre of those movies who IMDB rating is above average
select M.Movie_Name, M.IMDB_Rating, M.Genre
    from Movie M
        where M.IMDB_Rating>=(select avg(M1.IMDB_Rating) from Movie M1);

-- 2.5 Among all movie genres find the highest average IMDB rating
select M.Genre, M.IMDB_Rating from Movie M group by M.Genre having avg(M.IMDB_Rating)=(select max(evalAverage.avg)
from (select avg(M1.IMDB_Rating) as avg from Movie M1 group by Genre) evalAverage);
