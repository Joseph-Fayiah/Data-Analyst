-- CHALLENGE - Friendbook
CREATE DATABASE friendbook;
USE friendbook;
-- creating persons table 
CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, fullname TEXT, age
INTEGER);
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

-- creating hobbies table
CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
name TEXT);
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

-- creating friends table
CREATE table friends (id INTEGER PRIMARY KEY AUTO_INCREMENT, person1_id INTEGER,
person2_id INTEGER);
INSERT INTO friends (person1_id, person2_id)
VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
VALUES (2, 3);

/* We've created a database for a friend networking site, with a table storing data on each person,
a table on each person's hobbies, and a table of friend connections between the people. In this
first step, use a JOIN to display a table showing people's names with their hobbies. */
SELECT persons.fullname AS person, hobbies.name AS hobbies
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

/* Now, use another SELECT with a JOIN to show the names of each pair of friends, based on the
data in the friends table. */
SELECT p.fullname AS person, p1.fullname AS pair
FROM friends
JOIN persons p
ON friends.person1_id = p.id
JOIN persons p1
ON friends.person2_id = p1.id;