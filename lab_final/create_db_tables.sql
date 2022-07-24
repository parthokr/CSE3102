create database Bookish;

-- auto-generated definition
create table Author
(
    Author_ID    int auto_increment
        primary key,
    Author_Name  varchar(100) not null,
    Birth_Year   decimal(4)   not null,
    No_Of_Books  int          null,
    No_Of_Awards int          null
);

-- auto-generated definition
create table Book
(
    Book_No   int auto_increment
        primary key,
    Book_Name varchar(100) not null,
    Genre     varchar(100) not null,
    Language  varchar(100) not null
);

-- auto-generated definition
create table Characters
(
    Character_ID   int auto_increment
        primary key,
    Character_Name varchar(100) not null,
    Age            int          null
);

-- auto-generated definition
create table Book_Character_Relationship
(
    Character_ID int null,
    Book_No      int null,
    foreign key (Book_No) references Book (Book_No),
    foreign key (Character_ID) references Characters (Character_ID)
);

create table Publisher
(
    Publisher_ID   int auto_increment,
    Publisher_Name VARCHAR(100) not null,
    Country        VARCHAR(100) not null,
    primary key (Publisher_ID)
);


-- auto-generated definition
create table Author_Book_Relationship
(
    Book_No int null,
    Author_ID      int null,
    foreign key (Book_No) references Book (Book_No),
    foreign key (Author_ID) references Author (Author_ID)
);

-- insert data
insert into Bookish.Author (Author_ID, Author_Name, Birth_Year, No_Of_Books, No_Of_Awards)
values  (1, 'Rabindranath Thakur', 1861, 171, 50),
        (2, 'Zahir Raihan', 1935, 8, 5),
        (3, 'Satyajit Ray', 1921, 145, 30),
        (4, 'Sir Arthur Conan Doyle', 1859, 15, 12),
        (5, 'Anthony Mascarenhas', 1928, 3, null),
        (6, 'Jahanara Imam', 1929, 25, 10),
        (7, 'Sufia Kamal', 1911, 10, 3),
        (8, 'Robert Frost', 1874, null, null);

insert into Bookish.Book (Book_No, Book_Name, Genre, Language)
values  (1, 'Shesher Kobita', 'Drama', 'Bangla'),
        (2, 'Noukadubi', 'Drama', 'Bangla'),
        (3, 'GolpoGuccho', 'Short Stories', 'Bangla'),
        (4, 'Chokher Bali', 'Drama', 'Bangla'),
        (5, 'Gitanjali', 'Poetry', 'Bangla'),
        (6, 'Hajar Bochor Dhore', 'Drama', 'Bangla'),
        (7, 'Borof Gola Nodi', 'Drama', 'Bangla'),
        (8, 'Shesh Bikeler Meye', 'Drama', 'Bangla'),
        (9, 'Shonku Samagra', 'Science Fiction', 'Bangla'),
        (10, 'Golpo 101', 'Short Stories', 'Bangla'),
        (11, 'Hottyapuri', 'Detective', 'Bangla'),
        (12, 'Chinnomostar Ovishap', 'Detective', 'Bangla'),
        (13, 'A study in Scarlet', 'Detective', 'English'),
        (14, 'The Case-Book of Sherlock Holmes', 'Detective', 'English'),
        (15, 'Bangladesh: A Legacy of Blood', 'History', 'English'),
        (16, 'Ekattorer Dinguli', 'History', 'Bangla'),
        (17, 'Ekattorer Diary', 'History', 'Bangla'),
        (18, 'Kobita Somogro', 'Poetry', 'Bangla'),
        (19, 'Mountain Interval', 'Poetry', 'English');

insert into Bookish.Characters (Character_ID, Character_Name, Age)
values  (1, 'Amit Ray', 26),
        (2, 'KetakI', 22),
        (3, 'Labanya', 20),
        (4, 'Ramesh', 27),
        (5, 'Hemnalini', 24),
        (6, 'Nalinaksha', 30),
        (7, 'Kamala', 20),
        (8, 'Nirupoma', 15),
        (9, 'Postmaster', 24),
        (10, 'Ratan', 10),
        (11, 'Fotik', 10),
        (12, 'Kadombini', 18),
        (13, 'Mahendra', 25),
        (14, 'Binodini', 18),
        (15, 'Bihari', 23),
        (16, 'Tuni', 18),
        (17, 'Montu', 21),
        (18, 'Mokbul', 45),
        (19, 'Moriyom', 23),
        (20, 'Mahmud', 28),
        (21, 'Kashed', 27),
        (22, 'Jahanara', 24),
        (23, 'Professor Shonku', 59),
        (24, 'Nokur Chandra Biswas', 49),
        (25, 'Abinash Chandra Majumder', 53),
        (26, 'Tarini Charan Banerjee', 65),
        (27, 'Nyapla', 11),
        (28, 'Bonku Babu', 48),
        (29, 'Professor Hijibijbij', null),
        (30, 'Feluda', 26),
        (31, 'Jotayu', 48),
        (32, 'Topshe', 16),
        (33, 'Lakshman Bhattacharya', 35),
        (34, 'Mahesh Choudhury', 70),
        (35, 'Sherlock Holmes', 30),
        (36, 'Dr. Watson', 32),
        (37, 'Brigham Young', 33),
        (38, 'Adelbert Gruner', 35),
        (39, 'Grace Dunbar', 27),
        (40, 'Rumi', 21),
        (41, 'Sharif', 40);

insert into Bookish.Book_Character_Relationship (Character_ID, Book_No)
values  (1, 1),
        (2, 1),
        (3, 1),
        (4, 2),
        (5, 2),
        (6, 2),
        (7, 2),
        (8, 3),
        (9, 3),
        (10, 3),
        (11, 3),
        (12, 3),
        (13, 4),
        (14, 4),
        (15, 4),
        (16, 6),
        (17, 6),
        (18, 6),
        (19, 7),
        (20, 7),
        (21, 8),
        (22, 8),
        (23, 9),
        (24, 9),
        (25, 9),
        (26, 10),
        (27, 10),
        (28, 10),
        (29, 10),
        (30, 11),
        (31, 11),
        (32, 11),
        (33, 11),
        (30, 12),
        (31, 12),
        (32, 12),
        (34, 12),
        (35, 13),
        (36, 13),
        (37, 13),
        (35, 14),
        (36, 14),
        (38, 14),
        (39, 14),
        (40, 16),
        (41, 16);

insert into Bookish.Publisher (Publisher_ID, Publisher_Name, Country)
values  (1, 'Baatighar', 'Bangladesh'),
        (2, 'Suchoyoni Publishers', 'Bangladesh'),
        (3, 'Bishwasahitto Vobon', 'Bangladesh'),
        (4, 'The Sky Publishers', 'Bangladesh'),
        (5, 'Muktodhara', 'Bangladesh'),
        (6, 'Dip Prokason', 'India'),
        (7, 'Kalantor Prokashani', 'Bangladesh'),
        (8, 'Anupom Prokashani', 'Bangladesh'),
        (9, 'Ananda Publishers', 'India'),
        (10, 'Nowroze Kitabistan', 'Bangladesh'),
        (11, 'Little Scholarz Books', 'India'),
        (12, 'Rupa Publications', 'India'),
        (13, 'Hodder And Stoughton', 'India'),
        (14, 'Charulipi Prokashon', 'Bangladesh'),
        (15, 'Sondhani Prokashoni', 'Bangladesh'),
        (16, 'Hawlder Prokashoni', 'Bangladesh'),
        (17, 'Henry Holt', 'America');

insert into Bookish.Author_Book_Relationship (Book_No, Author_ID)
values  (1, 1),
        (2, 1),
        (3, 1),
        (4, 1),
        (5, 1),
        (6, 2),
        (7, 2),
        (8, 2),
        (9, 3),
        (10, 3),
        (11, 3),
        (12, 3),
        (13, 4),
        (14, 4),
        (15, 5),
        (16, 6),
        (17, 7),
        (18, 7),
        (19, 8);


