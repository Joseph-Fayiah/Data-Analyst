CREATE DATABASE movie_stars;
USE movie_stars;

-- creating table actors
CREATE TABLE actors (ID INT, Name VARCHAR(255), Birthdate DATE, Gender VARCHAR(10), MaritalStatus VARCHAR(20));

-- Populate the actors table with 10 movie stars
INSERT INTO actors (ID, Name, Birthdate, Gender, MaritalStatus)
VALUES 
    (1, 'Brad Pitt', '1963-12-18', 'Male', 'Divorced'),
    (2, 'Angelina Jolie', '1975-06-04', 'Female', 'Divorced'),
    (3, 'Leonardo DiCaprio', '1974-11-11', 'Male', 'Single'),
    (4, 'Jennifer Aniston', '1969-02-11', 'Female', 'Divorced'),
    (5, 'Tom Hanks', '1956-07-09', 'Male', 'Married'),
    (6, 'Julia Roberts', '1967-10-28', 'Female', 'Married'),
    (7, 'Johnny Depp', '1963-06-09', 'Male', 'Single'),
    (8, 'Meryl Streep', '1949-06-22', 'Female', 'Married'),
    (9, 'Robert Downey Jr.', '1965-04-04', 'Male', 'Married'),
    (10, 'Scarlett Johansson', '1984-11-22', 'Female', 'Married');

-- creating movie table
CREATE TABLE Movies ( MovieID INT, Title VARCHAR(255), ReleaseYear INT, LeadActorID INT);

-- Populate the Movies table with additional movies
INSERT INTO Movies (MovieID, Title, ReleaseYear, LeadActorID)
VALUES 
    (105, 'Forrest Gump', 1994, 5),
    (106, 'Pretty Woman', 1990, 6),
    (107, 'Pirates of the Caribbean', 2003, 7),
    (108, 'The Devil Wears Prada', 2006, 8),
    (109, 'Iron Man', 2008, 9),
    (110, 'Avengers: Endgame', 2019, 9),
    (111, 'Lost in Translation', 2003, 10),
    (112, 'Marriage Story', 2019, 10);
    
-- Create a table for Marriages
CREATE TABLE Marriages (
    HusbandID INT,
    WifeID INT
);

-- Populate the Marriages table with married stars
INSERT INTO Marriages (HusbandID, WifeID)
VALUES 
    (1, 2), -- Brad Pitt and Angelina Jolie
    (5, 6), -- Tom Hanks and Julia Roberts
    (9, 8), -- Meryl Streep and Robert Downey Jr.
    (9, 10); -- Scarlett Johansson and Robert Downey Jr.
    
-- matching actors to movies they were in
SELECT 
	a.Name AS actor,
    m.Title AS movie,
    m.ReleaseYear
FROM actors a
JOIN movies m
ON a.ID = m.LeadActorID;

-- finding actors and their spouses
SELECT 
	a.Name AS husband,
    b.Name AS wife
FROM marriages m
JOIN actors a
ON a.ID = m.HusbandID
JOIN actors b
ON b.ID = m.WifeID;


-- Adding columns to the actors table
ALTER TABLE actors
ADD COLUMN Nationality VARCHAR(50),
ADD COLUMN AwardsWon INT,
ADD COLUMN NetWorth DECIMAL(15,2);

-- Adding columns to the Movies table
ALTER TABLE Movies
ADD COLUMN Genre VARCHAR(50),
ADD COLUMN Director VARCHAR(255),
ADD COLUMN BoxOfficeRating DECIMAL(3,2),
ADD COLUMN TotalBoxOffice DECIMAL(20,2);

-- Updating the actors table with additional information
-- Nationality
UPDATE actors
SET Nationality = 'American'
WHERE ID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

-- Updating NetWorth and AwardsWon for existing actors
UPDATE actors
SET NetWorth = CASE ID
    WHEN 1 THEN 300000000.00 -- Net worth for Brad Pitt
    WHEN 2 THEN 160000000.00 -- Net worth for Angelina Jolie
    WHEN 3 THEN 260000000.00 -- Net worth for Leonardo DiCaprio
    WHEN 4 THEN 300000000.00 -- Net worth for Jennifer Aniston
    WHEN 5 THEN 350000000.00 -- Net worth for Tom Hanks
    WHEN 6 THEN 250000000.00 -- Net worth for Julia Roberts
    WHEN 7 THEN 150000000.00 -- Net worth for Johnny Depp
    WHEN 8 THEN 90000000.00  -- Net worth for Meryl Streep
    WHEN 9 THEN 300000000.00 -- Net worth for Robert Downey Jr.
    WHEN 10 THEN 165000000.00 -- Net worth for Scarlett Johansson
END,
AwardsWon = CASE ID
    WHEN 1 THEN 2 -- Awards won by Brad Pitt
    WHEN 2 THEN 3 -- Awards won by Angelina Jolie
    WHEN 3 THEN 3 -- Awards won by Leonardo DiCaprio
    WHEN 4 THEN 2 -- Awards won by Jennifer Aniston
    WHEN 5 THEN 2 -- Awards won by Tom Hanks
    WHEN 6 THEN 1 -- Awards won by Julia Roberts
    WHEN 7 THEN 1 -- Awards won by Johnny Depp
    WHEN 8 THEN 3 -- Awards won by Meryl Streep
    WHEN 9 THEN 2 -- Awards won by Robert Downey Jr.
    WHEN 10 THEN 1 -- Awards won by Scarlett Johansson
END
WHERE ID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);


-- Updating the Movies table with fictional data for existing entries
UPDATE movies
SET Genre = 'Drama', Director = 'Robert Zemeckis', BoxOfficeRating = 8.1, TotalBoxOffice = 678000000
WHERE MovieID = 105;-- box office for Forrest Gump

UPDATE movies
SET Genre = 'Romance', Director = 'Garry Marshall', BoxOfficeRating = 7.8, TotalBoxOffice = 463000000 
WHERE MovieID = 106; -- box office for Pretty Woman

UPDATE movies
SET Genre = 'Action-Adventure', Director = 'James Cameron', BoxOfficeRating = 7.8, TotalBoxOffice = 890000000
WHERE MovieID = 107; -- Pirates of the Caribbean

UPDATE movies
SET Genre = 'Comedy', Director = 'Nancy Meyers', BoxOfficeRating = 6.5, TotalBoxOffice = 124000000
WHERE MovieID = 108; -- The Devil Wears Prada

UPDATE movies
SET Genre = 'Action', Director = 'Jon Favreau', BoxOfficeRating = 7.9, TotalBoxOffice = 585000000
WHERE MovieID = 109; -- Iron Man

UPDATE movies
SET Genre = 'Action', Director = 'Anthony and Joe Russo', BoxOfficeRating = 8.4, TotalBoxOffice = 2797800564
WHERE MovieID = 110; -- Avengers: Endgame

UPDATE movies
SET Genre = 'Drama', Director = 'Sofia Coppola', BoxOfficeRating = 7.3, TotalBoxOffice = 119000000
WHERE MovieID = 111; -- Lost in Translation

UPDATE movies
SET Genre = 'Drama', Director = 'Noah Baumbach', BoxOfficeRating = 7.9, TotalBoxOffice = 53000000
WHERE MovieID = 112; -- Marriage Story

