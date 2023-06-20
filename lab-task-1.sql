DROP TABLE Journal;
DROP TABLE Publisher;

-- Q1A
CREATE TABLE Publisher (
Pub_ID NUMBER(4) PRIMARY KEY AUTO_INCREMENT,
Pub_Name VARCHAR2(25) DEFAULT 'Unknown',
City VARCHAR2(15) DEFAULT 'Chennai',
State VARCHAR2(15),
Country VARCHAR2(25) DEFAULT 'India',
URL VARCHAR2(25) UNIQUE
);

--
INSERT INTO Publisher VALUES (1, 'Publisher A', 'Chennai', 'Tamil Nadu', 'India', 'www.publisherA.com');
--
INSERT INTO Publisher VALUES (2, 'Publisher B', 'Los Angeles', 'California', 'USA', 'www.publisherB.com');
--
INSERT INTO Publisher VALUES (3, 'Publisher C', 'Delhi', 'Delhi', 'India', 'www.publisherC.com');
--
INSERT INTO Publisher VALUES (4, 'Publisher D', 'Kolkata', 'West Bengal', 'India', 'www.publisherD.com');
--
INSERT INTO Publisher VALUES (5, 'Publisher E', 'Bengaluru', 'Karnataka', 'India', 'www.publisherE.com');


-- Q1B
CREATE TABLE Journal (
Paper_ID NUMBER(5) PRIMARY KEY AUTO_INCREMENT,,
Paper_Title VARCHAR2(25),
Pub_ID NUMBER(4),
Pub_Date DATE,
Pub_Cost NUMBER(12, 2),
Process_Cost NUMBER(12, 2) DEFAULT 0,
Royalty NUMBER(3, 2) DEFAULT 0.12
);

--
INSERT INTO Journal VALUES (1, 'Paper 1', 1, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1001, 200, 0.12);
--
INSERT INTO Journal VALUES (2, 'Paper 2', 2, TO_DATE('2022-02-01', 'YYYY-MM-DD'), 1500, 300, 0.12);
--
INSERT INTO Journal VALUES (3, 'Paper 3', 3, TO_DATE('2022-03-01', 'YYYY-MM-DD'), 2000, 400, 0.12);
--
INSERT INTO Journal VALUES (4, 'Paper 4', 4, TO_DATE('2022-04-01', 'YYYY-MM-DD'), 2500, 500, 0.12);
--
INSERT INTO Journal VALUES (5, 'Paper 5', 5, TO_DATE('2022-05-01', 'YYYY-MM-DD'), 3000, 600, 0.12);

-- Q2a

ALTER TABLE Journal
ADD CONSTRAINT CHK_PublicationCost CHECK (Pub_Cost > 1000 AND Pub_Cost < 9999);

-- Q2b

ALTER TABLE Publisher
ADD CONSTRAINT pname CHECK (Pub_Name <> 'XYZ');

-- Q2c

ALTER TABLE Journal
ADD CONSTRAINT prname CHECK (Paper_Title <> 'PQR' AND Process_Cost >= 0);

-- Q2d

ALTER TABLE Publisher
ADD Mobile_Number VARCHAR2(10);

-- Q2e

ALTER TABLE Journal
ADD CONSTRAINT CHK_Royalty CHECK (Royalty >= 0 AND Royalty <= 1);

-- Q2h

ALTER TABLE Journal
ADD CONSTRAINT FK_PubID FOREIGN KEY (Pub_ID)
REFERENCES Publisher(Pub_ID)
ON DELETE CASCADE;

-- Q2i

ALTER TABLE Journal
RENAME COLUMN Process_Cost TO ProcessingCost;

-- Q2j

ALTER TABLE Journal
ADD GST_Cost NUMBER(3, 2) DEFAULT 0.08;



-- Q3a

SELECT *
FROM Publisher
WHERE Pub_Name LIKE 'IEEE%';

-- Q3b

SELECT *
FROM Publisher
WHERE City = 'Chennai';

-- Q3c

SELECT Pub_Name, URL
FROM Publisher
WHERE Country <> 'India';

-- Q3d - UPPER: Convert Pub_Name to uppercase
SELECT UPPER(Pub_Name) FROM Publisher;

-- Q3d - LOWER: Convert Pub_Name to lowercase
SELECT LOWER(Pub_Name) FROM Publisher;

-- Q3d - INITCAP: Convert Pub_Name to initial capital letters
SELECT INITCAP(Pub_Name) FROM Publisher;

-- Q3d - LENGTH: Get the length of Pub_Name
SELECT LENGTH(Pub_Name) FROM Publisher;

-- Q3d - LPAD: Left pad Pub_Name with '*' to a total length of 10 characters
SELECT LPAD(Pub_Name, 10, '*') FROM Publisher;

-- Q3d - RPAD: Right pad Pub_Name with '*' to a total length of 10 characters
SELECT RPAD(Pub_Name, 10, '*') FROM Publisher;

-- Q3d - LTRIM: Remove leading spaces from Pub_Name
SELECT LTRIM(Pub_Name) FROM Publisher;

-- Q3d - RTRIM: Remove trailing spaces from Pub_Name
SELECT RTRIM(Pub_Name) FROM Publisher;

-- Q3d - TRIM: Remove leading and trailing spaces from Pub_Name
SELECT TRIM(Pub_Name) FROM Publisher;

-- Q3d - NVL: Replace NULL Pub_Name with 'Not Available'
SELECT NVL(Pub_Name, 'Not Available') FROM Publisher;

-- Q3e

SELECT *
FROM Publisher
ORDER BY Pub_Name;

-- Q3f

SELECT Pub_Name
FROM Publisher
WHERE Country = 'India' AND City = 'Mumbai';

-- Q3g (SYSDATE gets the current date)

SELECT *
FROM Journal
WHERE Pub_Date <= SYSDATE;

-- Q3h

SELECT Paper_ID, (ProcessingCost + Pub_Cost) * GST_Cost AS GST_Amount
FROM Journal;

-- Q3i

DELETE FROM Publisher
WHERE Pub_Name = 'RI Publisher';

-- Q3j (Pub_ID 10 NOT in the Publisher table, so insertion will fail, maintaining referential integrity.)

INSERT INTO Journal VALUES (5, 'New Paper', 10, SYSDATE, 1500, 100, 0.12, 0.08);


-- Q3k

UPDATE Publisher
SET Country = 'New Zealand'
WHERE Pub_Name = 'Publisher C';

-- Q3l

SELECT COUNT(*) AS Publisher_Count
FROM Publisher;

-- Q3m

SELECT COUNT(*) AS Publisher_Count
FROM Publisher
WHERE Country = 'USA';

-- Q3n

SELECT Country, COUNT(*) AS Publisher_Count
FROM Publisher
GROUP BY Country
ORDER BY Publisher_Count DESC;

-- Q3p

SELECT Country, COUNT(*) AS Publisher_Count
FROM Publisher
GROUP BY Country
HAVING COUNT(*) >= 2;

-- Q3q

SELECT SUM(ProcessingCost) AS Total_Cost,
AVG(ProcessingCost) AS Avg_Cost,
MIN(ProcessingCost) AS Min_Cost,
MAX(ProcessingCost) AS Max_Cost
FROM Journal;

-- Q3r

SELECT EXTRACT(YEAR FROM Pub_Date) AS Year,
SUM(Pub_Cost) AS Total_Amount
FROM Journal
GROUP BY EXTRACT(YEAR FROM Pub_Date);

-- Q3s

SELECT Pub_ID, AVG(Pub_Cost)
FROM Journal
GROUP BY Pub_ID;


-- Q3t

SELECT EXTRACT(YEAR FROM Pub_Date) AS Year,
COUNT(*) AS Total_Papers,
MAX(Pub_Cost) AS Max_Publication_Cost,
MIN(Pub_Cost) AS Min_Publication_Cost
FROM Journal
GROUP BY EXTRACT(YEAR FROM Pub_Date);

-- Q3u

SELECT MAX(avg_costs.avg) as max_avg_publishing_cost
FROM (
  SELECT AVG(Pub_Cost) as avg
  FROM Journal
  GROUP BY Pub_ID 
)avg_costs;

-- Q3v

SELECT Pub_ID
FROM Journal
GROUP BY Pub_ID
HAVING COUNT(*) > 5;

-- Q3w

SELECT Paper_ID, Pub_Cost
FROM Journal
ORDER BY Pub_Cost;

-- Q3x (MONTHS_BETWEEN used to calculate the difference in moths)

SELECT Paper_ID, MONTHS_BETWEEN(SYSDATE, Pub_Date) AS Months_Difference
FROM Journal;

-- Q3y

SELECT Paper_ID, TO_CHAR(Pub_Date, 'DD Mon YYYY HH:MI:SS') AS Pub_Date_Formatted
FROM Journal;

-- Q3z

SELECT TO_CHAR(Pub_Date, 'YYYY-MM-DD HH24:MI:SS') AS Pub_Date_Formatted
FROM Journal;