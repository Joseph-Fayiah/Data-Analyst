-- Challenge 1 : DYNAMIC DOCUMENTS
-- Creating documents table
CREATE table documents (id INTEGER PRIMARY KEY AUTO_INCREMENT, title TEXT,content 
TEXT,author TEXT);
INSERT INTO documents (author, title, content)
 VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
 VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
 INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates, 
heights.");

/* We've created a database for a documents app, with rows for each document with its title,
content, and author. In this first step, use UPDATE to change the author to 'Jackie Draper' for all
rows where it's currently 'Jackie Paper'. Then re-select all the rows to make sure the table
changed like you expected */

SELECT * FROM documents;

UPDATE documents SET author = "Jackie Draper"
WHERE id IN (3, 4, 5);

-- Querying the updated table
SELECT * FROM documents;

/* Now you'll delete a row, being very careful not to delete all the rows. Only delete the row where
the title is 'Things I'm Afraid Of'. Then re-select all the rows to make sure the table changed like
you expected */

DELETE FROM documents
WHERE ID = 5; 

SELECT * FROM documents;

-- Challenge 2 Clothing Alterations

CREATE TABLE clothes (id INTEGER PRIMARY KEY AUTO_INCREMENT, type TEXT,design TEXT);
INSERT INTO clothes (type, design)
 VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
 VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
 VALUES ("blazer", "black sequin");
 
 /* We've created a database of clothes, and decided we need a price column. Use ALTER to add a
'price' column to the table. Then select all the columns in each row to see what your table looks
like now. */

SELECT * FROM clothes;

ALTER TABLE clothes ADD price VARCHAR(255) NOT NULL;
SELECT * FROM clothes;

/*Now assign each item a price, using UPDATE - item 1 should be 10 dollars, item 2 should be 20
dollars, item 3 should be 30 dollars. When you're done, do another SELECT of all the rows to
check that it worked as expected. */

UPDATE clothes SET price = "$10"
WHERE id =1;
UPDATE clothes SET price = "$20"
WHERE id =2;
UPDATE clothes SET price = "$30"
WHERE id =3;

-- querying the altered table

SELECT * 
FROM clothes;

/* Now insert a new item into the table that has all three attributes filled in, including 'price'. Do one
final SELECT of all the rows to check it worked. */

INSERT INTO clothes (type, design, price)
VALUES ("suit", "striped", "$40");

SELECT * 
FROM clothes;
