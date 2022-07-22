use Movie_Info;

-- 4.1 Find all name and age of all movie characters who are not teenagers
select Character_Name, Age
from Movie_Characters
where not (12 < Age and Age < 20);

-- 4.2 Find the movie id of all movie and the number of movie characters in each movie
select Movie_ID, count(Character_ID)
from Movie_Character_Relationship
group by Movie_ID;

-- 4.3 Find the movie name of all movies and the number of movie characters in each movie
select M.Movie_Name, count(Character_ID)
from Movie_Character_Relationship MCR,
     Movie M
where MCR.Movie_ID = M.Movie_ID
group by MCR.Movie_ID;

-- 4.4 Find the name, year of release, imdb rating and the name of the director of all movies that contain at least 12
--      characters including spaces in their name

select M.Movie_Name, M.Year, M.IMDB_Rating, D.Director_Name
from Movie M,
     Director D
where M.Director_ID = D.Person_ID
  and length(M.Movie_Name) >= 12;

-- 4.5 Find the name, year of release, imdb rating and the name of the director of all movies that contain at most 12
--      characters including spaces in their name

select M.Movie_Name, M.Year, M.IMDB_Rating, D.Director_Name
from Movie M,
     Director D
where M.Director_ID = D.Person_ID
  and length(M.Movie_Name) <= 12;

-- 4.6 Find the name, year of release, imdb rating of all movies of Byomkesh (NB. A movie of Byomkesh may not contain
-- the term 'Byomkesh' in its name)
select Movie_Name, Year, IMDB_Rating
from Movie
         inner join
     ((select distinct Movie_ID
       from Movie_Character_Relationship
       where Movie_Character_Relationship.Character_ID =
             (select Character_ID from Movie_Characters where Character_Name like '%Byomkesh%'))
      union
      (select Movie_ID from Movie where Movie_Name like '%Byomkesh%')) Byomkeshs_Movies
     on Movie.Movie_ID = Byomkeshs_Movies.Movie_ID;

-- Alternative
select Movie_Name, Year, IMDB_Rating
from Movie
where Movie_ID in
      (select distinct Movie_ID
       from Movie_Character_Relationship
                inner join
            (select Character_ID from Movie_Characters where Character_Name like '%Byomkesh%') Byomkesh_CID
            on Movie_Character_Relationship.Character_ID = Byomkesh_CID.Character_ID)
   or Movie_ID in (select Movie_ID from Movie where Movie_Name like '%Byomkesh%');

-- 4.7 Find the name, age of all characters from the movies of Feluda (NB. A movie of Feluda may not contain the term
-- Feluda in its name)
select Character_Name, Age
from Movie_Characters
where Character_ID in (select Character_ID
                       from Movie_Character_Relationship
                       where Movie_ID in (select Movie_ID
                                          from Movie
                                          where Movie_Name like '%Feluda%'
                                          union
                                          select Movie_ID
                                          from Movie_Character_Relationship
                                          where Character_ID in
                                                (select Character_ID
                                                 from Movie_Characters
                                                 where Character_Name like '%Feluda%')));

-- 5.1 Movie inner join Movie character (as view)
create view VIEW1 as
select temp.Movie_ID, temp.Movie_Name, MC.Character_ID, MC.Character_Name, MC.Age
from Movie_Characters MC
         inner join
     (select M.Movie_ID, M.Movie_Name, MCR.Character_ID
      from Movie M
               inner join
               (select Character_ID, Movie_ID from Movie_Character_Relationship) MCR on M.Movie_ID = MCR.Movie_ID) temp
     on MC.Character_ID = temp.Character_ID;

-- 5.2 Each genre and highest imdb rating in each genre
create view VIEW2 as
select distinct Genre, max(IMDB_Rating)
from Movie
group by Genre;

-- 5.3 From movie relation
create view VIEW3 as
select *
from Movie;

-- Test update
update VIEW1
SET Movie_Name='TEST'
where Movie_ID = 1;
drop view VIEW1;
select *
from VIEW1;

-- Test insert
insert into VIEW1(movie_id, movie_name, character_id, character_name, age)
values (100, 'TEST', 100, 'TEST', 100);


-- Home task
-- Find the name & age of all characters from all the movies directed by Satyajit Ray
-- 1. By using sub queries (only)
-- 2. By using joining (only)

-- By sub queries
select MC.Character_Name, MC.Age
from Movie_Characters MC
where MC.Character_ID in
      (select MCR.Character_ID
       from Movie_Character_Relationship MCR
       where MCR.Movie_ID in
             (select M.Movie_ID
              from Movie M
              where M.Director_ID in
                    (select D.Person_ID
                     from Director D
                     where Director_Name = 'Satyajit Ray')));

-- By join
select distinct MC.Character_Name, MC.Age
from Movie_Characters MC
         inner join (select MCR.Character_ID
                     from Movie_Character_Relationship MCR
                              inner join (select M.Movie_ID
                                          from Movie M
                                                   inner join
                                               (select D.Person_ID
                                                from Director D
                                                where D.Director_Name = 'Satyajit Ray') D
                                               on M.Director_ID = D.Person_ID) M
                                         on MCR.Movie_ID = M.Movie_ID) C on MC.Character_ID = C.Character_ID;








