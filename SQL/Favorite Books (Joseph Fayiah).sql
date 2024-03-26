/** Creating a Database named Book_tist **/
CREATE DATABASE book_list;
USE book_list; -- using the book list database we just created

/* Creating table 'favorite books' */
CREATE TABLE fav_books (
ID INTEGER PRIMARY KEY,
Name TEXT,
Rating INTEGER
);

/* Inserting records into fav_books table */
INSERT INTO fav_books (ID, Name, Rating)
VALUES
(1, "The Alchemist", 5),
(2, "A man called Ove", 5),
(3, "Just like Jesus", 5),
(4, "How Happiness Happens", 4),
(5, "Mythos", 4),
(6, "Heroes of Change", 4),
(7, "Grief Child", 3),
(8, "Romeo and Juliet", 5),
(9, "Julius Caesar", 4),
(10, "Hamlet", 3),
(11, "The Hawk and the Hen", 5),
(12, "Scars of Love", 4),
(13, "Why no one knows when he will die", 4),
(14, "Pompeii", 5),
(15, "The Hobbit", 5),
(16, "Ricochet", 4),
(17, "Honour Bound", 5),
(18, "Things Fall Apart", 5),
(19, "The Frog Prince", 3),
(20, "Rapunzel", 4),
(21, "The Adventures of Tintin", 5),
(22, "Mulan", 4),
(23, "The Merchant of Vernice", 5),
(24, "The Adventures of Tom Sawyer", 4),
(25, "The Last Mohican", 5),
(26, "Cyrano de Bergerac", 5),
(27, "The Prodigal Son", 5),
(28, "Dracula", 4),
(29, "Snake Girl", 2),
(30, "Macbeth", 4);

/* Retrieving all records from fav_books table */
SELECT * FROM fav_books;