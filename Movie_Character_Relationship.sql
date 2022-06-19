-- auto-generated definition
use Movie_Info;
create table Movie_Character_Relationship
(
    Character_ID int null,
    Movie_ID     int null,
    constraint Movie_ID
        foreign key (Movie_ID) references Movie (Movie_ID)
);

insert into Movie_Info.Movie_Character_Relationship (Character_ID, Movie_ID)
values  (1, 1),
        (2, 1),
        (3, 1),
        (4, 1),
        (5, 2),
        (6, 2),
        (7, 2),
        (8, 2),
        (9, 3),
        (10, 3),
        (11, 4),
        (12, 4),
        (13, 4),
        (14, 4),
        (15, 4),
        (16, 5),
        (17, 5),
        (18, 5),
        (19, 6),
        (20, 6),
        (21, 6),
        (22, 6),
        (23, 7),
        (24, 7),
        (25, 8),
        (26, 8),
        (27, 8),
        (28, 10),
        (28, 9),
        (29, 9),
        (29, 10),
        (30, 9),
        (31, 9),
        (32, 9),
        (33, 10),
        (34, 9),
        (34, 10),
        (35, 10),
        (36, 11),
        (37, 11),
        (38, 11),
        (39, 11);

