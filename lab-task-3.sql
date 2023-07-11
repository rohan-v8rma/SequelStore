--
DROP TABLE author_pub;
DROP TABLE pub;
DROP TABLE book;
DROP TABLE author;

-- Creating the 'author' table
CREATE TABLE author (
  author_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

-- Insert data into the 'author' table
INSERT INTO author VALUES (1, 'John', 'McCarthy');
INSERT INTO author VALUES (2, 'Dennis', 'Ritchie');
INSERT INTO author VALUES (3, 'Ken', 'Thompson');
INSERT INTO author VALUES (4, 'Claude', 'Shannon');
INSERT INTO author VALUES (5, 'Alan', 'Turing');
INSERT INTO author VALUES (6, 'Alonzo', 'Church');
INSERT INTO author VALUES (7, 'Perry', 'White');
INSERT INTO author VALUES (8, 'Moshe', 'Vardi');
INSERT INTO author VALUES (9, 'Roy', 'Batty');

-- Creating the 'book' table
CREATE TABLE book (
  book_id INT PRIMARY KEY,
  book_title VARCHAR(100),
  month VARCHAR(20),
  year INT,
  editor INT,
  FOREIGN KEY (editor) REFERENCES author(author_id)
);

-- Insert data into the 'book' table
INSERT INTO book VALUES (1, 'CACM', 'April', 1960, 8);
INSERT INTO book VALUES (2, 'CACM', 'July', 1974, 8);
INSERT INTO book VALUES (3, 'BST', 'July', 1948, 2);
INSERT INTO book VALUES (4, 'LMS', 'November', 1936, 7);
INSERT INTO book VALUES (5, 'Mind', 'October', 1950, NULL);
INSERT INTO book VALUES (6, 'AMS', 'Month', 1941, NULL);
INSERT INTO book VALUES (7, 'AAAI', 'July', 2012, 9);
INSERT INTO book VALUES (8, 'NIPS', 'July', 2012, 9);

-- Creating the 'pub' table
CREATE TABLE pub (
  pub_id INT PRIMARY KEY,
  title VARCHAR(100),
  book_id INT,
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Insert data into the 'pub' table
INSERT INTO pub VALUES (1, 'LISP', 1);
INSERT INTO pub VALUES (2, 'Unix', 2);
INSERT INTO pub VALUES (3, 'Info Theory', 3);
INSERT INTO pub VALUES (4, 'Turing Machines', 4);
INSERT INTO pub VALUES (5, 'Turing Test', 5);
INSERT INTO pub VALUES (6, 'Lambda Calculus', 6);


-- Creating the 'author_pub' table
CREATE TABLE author_pub (
  author_id INT,
  pub_id INT,
  author_position INT,
  FOREIGN KEY (author_id) REFERENCES author(author_id),
  FOREIGN KEY (pub_id) REFERENCES pub(pub_id) ON DELETE SET NULL
);

-- Insert data into the 'author_pub' table
INSERT INTO author_pub VALUES (1, 1, 1);
INSERT INTO author_pub VALUES (2, 2, 1);
INSERT INTO author_pub VALUES (3, 2, 2);
INSERT INTO author_pub VALUES (4, 3, 1);
INSERT INTO author_pub VALUES (5, 4, 1);
INSERT INTO author_pub VALUES (5, 5, 1);
INSERT INTO author_pub VALUES (6, 6, 1);

-- Q1 (Used %type declaration to prevent type mismatch)
DECLARE
    bookId book.book_id%type := 1;
    bookTitle book.book_title%type;
BEGIN
    SELECT book_title INTO bookTitle
    FROM book
    WHERE book.book_id = bookId;

    dbms_output.put_line('The title of the book with book_id `' || bookId || '` is: ' || bookTitle);
END;
/

-- Q2 (Used DELETE FROM statement, and used SELECT to show that record has been deleted)
DECLARE
    publisherId pub.pub_id%type := 3;
BEGIN
    DELETE FROM pub
    WHERE pub.pub_id = publisherId;
END;
/

SELECT * FROM pub;

-- Q3 (Used UPDATE and SET clauses) (= NULL doesn't work. Used IS NULL)
DECLARE
    updateAuthorId author.author_id%type := 7;
BEGIN
    UPDATE book
    SET book.editor = updateAuthorId
    WHERE book.editor IS NULL;
END;
/
SELECT * FROM book;

-- Q5 (Used typical counting method, and displayed the result using the PL SQL output command)
DECLARE
    bookCount INT;
    authorId author.author_id%type := 7;
BEGIN
    SELECT COUNT(*) INTO bookCount
    FROM author_pub
    WHERE author_pub.author_id = authorId;
    
    dbms_output.put_line('The number of books published by author `' || authorId || '` is: ' || bookCount);
END;
/

-- Q6 (Procedure to check if a publisher name start with RI)
CREATE OR REPLACE PROCEDURE check_publisher_title AS
  l_count INT;
BEGIN
  SELECT COUNT(*)
  INTO l_count
  FROM pub
  WHERE title LIKE 'RI%';

  IF l_count > 0 THEN
    dbms_output.put_line('Publisher title should not start with "RI". `'|| l_count || '` violations found.');
  ELSE
    dbms_output.put_line('No violations found');
  END IF;
END;
/

BEGIN
    check_publisher_title();
    INSERT INTO pub VALUES(7, 'RING', 8);
    check_publisher_title();
END;
/
    
-- Q7 (Counted authors who have edited as well using DISTINCT keyword) (Used return instead of printing inside function to demonstrate utility over procedure)
CREATE OR REPLACE FUNCTION count_author_editors
RETURN INT
IS
count_of_authors_who_have_edited INT;
BEGIN
    SELECT COUNT(DISTINCT editor) INTO count_of_authors_who_have_edited
    FROM book;

    RETURN count_of_authors_who_have_edited;
END;
/

DECLARE
    req_count INT;
BEGIN
    req_count := count_author_editors();
    dbms_output.put_line('The count of authors who have edited as well is: ' || req_count);
END;
/

-- Q8 (Cursor to list out author names who have NOT edited books)
DECLARE
    CURSOR not_editors IS
    	SELECT *
    	FROM author
    	WHERE author_id in (
            select author_id
            FROM author
            MINUS
            SELECT DISTINCT editor
            FROM book
    	);
BEGIN
	-- LOOP keyword denotes start of looping block
	FOR rec in not_editors LOOP
		dbms_output.put_line(rec.first_name || ' ' || rec.last_name);
	END LOOP;
END;
/

-- Q8 (Cursor to list out author names who have NOT edited books) (OPTIMIZED select query)
DECLARE
    CURSOR not_editors IS
    	SELECT author.first_name, author.last_name
    	FROM author
    	WHERE author_id NOT IN (SELECT DISTINCT editor FROM book);
BEGIN
	-- LOOP keyword denotes start of looping block
	FOR rec in not_editors LOOP
		dbms_output.put_line(rec.first_name || ' ' || rec.last_name);
	END LOOP;
END;
/

-- Q9 (Trigger for insertion/updation)
CREATE OR REPLACE TRIGGER book_trigger
-- This means we perform the check before inserting/updating the received data.
BEFORE INSERT OR UPDATE ON book
-- Perform this check for each row of the inserted data.
FOR EACH ROW
DECLARE
  req_count INT;
  trigger_exception EXCEPTION;
BEGIN
  IF :new.editor IS NOT NULL THEN
    SELECT COUNT(author_id) INTO req_count
    FROM author
    WHERE author_id = :new.editor;

    IF req_count = 0 THEN 
      RAISE trigger_exception;
    END IF;
  END IF;
EXCEPTION
  WHEN trigger_exception THEN
    dbms_output.put_line('The editor value is NOT valid');
END;
/

-- Q10 (Authors who published any books with publisher ‘2’ during June) (Unoptimized)
DECLARE
    CURSOR req_authors IS
        SELECT a.first_name, a.last_name
        FROM author a
        INNER JOIN author_pub ap ON a.author_id = ap.author_id
        INNER JOIN pub p on ap.pub_id = p.pub_id
        INNER JOIN book b ON b.book_id = p.book_id
        WHERE b.month = 'July' AND p.pub_id = 2;
    
BEGIN
    FOR record in req_authors LOOP
        dbms_output.put_line(record.first_name || ' ' || record.last_name);
	END LOOP;
END;
/
    
-- Q10 (Authors who published any books with publisher ‘2’ during June) (Optimized)
DECLARE
    CURSOR req_authors IS
        SELECT a.first_name, a.last_name
        FROM author a
        INNER JOIN author_pub ap ON a.author_id = ap.author_id
        INNER JOIN (
    	  -- Filtering before joining
          Select book_id, pub_id 
          from pub
          WHERE pub_id = 2
        ) p on ap.pub_id = p.pub_id
        INNER JOIN (
          -- Filtering before joining
          SELECT book_id
          FROM book 
          WHERE month = 'July'
        ) b ON b.book_id = p.book_id;
BEGIN
    FOR record in req_authors LOOP
        dbms_output.put_line(record.first_name || ' ' || record.last_name);
	END LOOP;
END;