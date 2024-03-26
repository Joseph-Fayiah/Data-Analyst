CREATE DATABASE day_5;
USE day_5;

/** challenge 1 **/

/**creating table persons and inserting values **/
CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age
INTEGER);
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);
INSERT INTO persons (name, age) VALUES ("Jerry Jay", 9);
INSERT INTO persons (name, age) VALUES ("Teng Teng", 16);

/**creating table hobbies and inserting values **/
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
INSERT INTO hobbies (person_id, name) VALUES (5, "hunting");
INSERT INTO hobbies (person_id, name) VALUES (7, "sleeping");

/** quering both tables **/
SELECT * FROM persons;
SELECT * FROM hobbies;

/** inner join tables **/
SELECT persons.name, hobbies.name
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

/** inner join tables and alaising tables **/
SELECT persons.name AS person_name, hobbies.name AS hobbies_name
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

/** inner join tables and alaising tables where name in the persons table is  "Bobby McBobbyFace" **/
SELECT persons.name AS person_name, hobbies.name AS hobbies_name
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id
WHERE persons.name = "Bobby McBobbyFace";


/** challenge 2 **/

/**creating table customers and inserting values **/
CREATE TABLE customers (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, email
TEXT);
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

/**creating table orders and inserting values **/
CREATE TABLE orders (id INTEGER PRIMARY KEY AUTO_INCREMENT,customer_id INTEGER,item
TEXT,price REAL);
INSERT INTO orders (customer_id, item, price)
VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
VALUES (1, "TARDIS", 1000000.00);

/** quering both tables **/
SELECT * FROM customers;
SELECT * FROM orders;

/** left outer join tables **/
SELECT customers.name, customers.email, orders.item, orders.price
FROM customers
LEFT OUTER JOIN orders
ON customers.id = orders.customer_id;

/** left outer join tables, group_by ids and order_by sum of order price from highest to lowest **/
SELECT customers.name, customers.email, SUM(orders.price)
FROM customers
LEFT OUTER JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY SUM(orders.price) DESC;


/** challenge 3 **/

/**creating table movies and inserting values **/
CREATE TABLE movies (id INTEGER PRIMARY KEY AUTO_INCREMENT,title TEXT,released
INTEGER,sequel_id INTEGER);
INSERT INTO movies VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

/** quering table **/
SELECT * FROM movies;

/** self join table using left outer joins **/
SELECT movies.title AS movie_title, sequel.title AS sequel_title
FROM movies
LEFT OUTER JOIN movies AS sequel
ON movies.sequel_id = sequel.id;