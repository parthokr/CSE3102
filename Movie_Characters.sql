-- auto-generated definition
use Movie_Info;
create table Movie_Characters
(
    Character_ID   int auto_increment
        primary key,
    Character_Name varchar(256) null,
    Age            int          null
);

insert into Movie_Info.Movie_Characters (Character_ID, Character_Name, Age)
values  (1, 'Apu', 7),
        (2, 'Durga', 10),
        (3, 'Harihar', 42),
        (4, 'Sarbajaya', 35),
        (5, 'Ramesh', 28),
        (6, 'Hemnalini', 25),
        (7, 'Nalinaksha', 30),
        (8, 'Kamala', 20),
        (9, 'Shikha', 21),
        (10, 'Apratim', 26),
        (11, 'Feluda', 25),
        (12, 'Maganlal Meghraj', 35),
        (13, 'Jatayu', 45),
        (14, 'Topshe', 18),
        (15, 'Ruku', 6),
        (16, 'Faruk', 22),
        (17, 'Bithi', 19),
        (18, 'Sathi', 24),
        (19, 'Lalon', null),
        (20, 'Kaluah', 25),
        (21, 'Siraj Saain', 45),
        (22, 'Komli', 25),
        (23, 'Subir Banerjee', null),
        (24, 'Ashima', 24),
        (25, 'Rashmoni', null),
        (26, 'Somalata', 24),
        (27, 'Chaitali', 18),
        (28, 'Byomkesh Bakshi', 26),
        (29, 'Ajit', 27),
        (30, 'Malati', 16),
        (31, 'Debkumar', 50),
        (32, 'Doctor Anukul', 45),
        (33, 'Prabhat', 27),
        (34, 'Satyabati', 22),
        (35, 'Andi Babu', 55),
        (36, 'PK', null),
        (37, 'Jaggu', 26),
        (38, 'Sarfaraz', 29),
        (39, 'Tapasvi Maharaj', 50);

