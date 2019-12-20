CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

  - creates a second table to hold shelf names

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

  - retrieves unique bookshelf names and inserts them into the new bookshelf table

ALTER TABLE books ADD COLUMN bookshelf_id INT;

  - adds a column to the original books table that has the bookshelf id number we created

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

  - makes a connection between the two tables (thereby connecting each book to its appropriate shelf in the shelf table)

ALTER TABLE books DROP COLUMN bookshelf;

  - removes the column bookshelf from the original table

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

  - modifies the data type of bookshelf_id column, making it a foreign key that references the primary key in the new bookshelves table. Essentially telling postgres how the two tables are connected.