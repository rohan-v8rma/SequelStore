DROP TABLE Players;

-- Q1

CREATE TABLE Player (
    player_id INT PRIMARY KEY,
    name VARCHAR(20),
    country VARCHAR(20),
    goals INT DEFAULT 0
);

SELECT * FROM Player;

-- Q2

ALTER TABLE Player ADD age INT;
DESC Player;

-- MODIFY a column
ALTER TABLE Player MODIFY goals INT DEFAULT 0;
DESC Player;

-- DROP a column
ALTER TABLE Player DROP COLUMN age;
DESC Player;

CREATE TABLE sample(sample_col INT PRIMARY KEY);
DROP TABLE sample;


--Q3

-- Rename a column
ALTER TABLE Player RENAME COLUMN player_id TO pid;


--Q4

-- Rename the table
ALTER TABLE Player RENAME TO Players;

--Q5

INSERT INTO Players VALUES (101, 'Sam', 'USA', 6);
INSERT INTO Players VALUES (103, 'Daniel', 'England', 7);
INSERT INTO Players VALUES (104, 'Anthony', 'France', 10);
INSERT INTO Players VALUES (102, 'Bruno', 'Sweden', 6);
INSERT INTO Players VALUES (105, 'Alex', 'Wales', 5);
INSERT INTO Players VALUES (106, 'Matt', 'Scotland', 3);


--Q6

SELECT * FROM Players;


--Q7

INSERT INTO Players (pid, country) VALUES (107, 'Germany');
INSERT INTO Players (pid, country) VALUES (108, 'Brazil');

--Q8

SELECT * FROM Players;

--Q9

ALTER TABLE Players
ADD gender VARCHAR(20);

UPDATE Players 
    SET gender='Male';

--Q10

UPDATE Players 
    SET goals=goals+1;

--Q11

UPDATE Players 
    SET country='ENG' 
    WHERE country='England';

--Q12

UPDATE Players 
    SET country='India' 
    WHERE pid=105;

--Q13

UPDATE Players 
    SET name='Raja' 
    WHERE pid=104;

--Q14

UPDATE Players 
    SET name='Joseph', country='India' 
    WHERE pid=102;

--Q15

DELETE FROM Players 
    WHERE country='France';

--Q16

DELETE FROM Players 
    WHERE goals<3
    AND country='India';

SELECT * FROM Players;

