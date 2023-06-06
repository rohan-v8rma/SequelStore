--
DROP TABLE Tutorial;
DROP TABLE Tutorial_Info;

-- Create Tutorial table
CREATE TABLE Tutorial (
  id INT PRIMARY KEY,
  title VARCHAR(50),
  subject VARCHAR(50),
  duration FLOAT(10),
  upload_date DATE
);

-- Insert rows into Tutorial table
INSERT INTO Tutorial VALUES (1, 'Select Query', 'SQL', 4.56, TO_DATE('2013-08-08', 'YYYY-MM-DD'));
INSERT INTO Tutorial VALUES (2, 'Insert Query', 'SQL', 5.32, TO_DATE('2013-08-08', 'YYYY-MM-DD'));
INSERT INTO Tutorial VALUES (3, 'Arithmetic Operators', 'SQL', 6.37, TO_DATE('2013-08-08', 'YYYY-MM-DD'));
INSERT INTO Tutorial VALUES (4, 'Logical Operators', 'SQL', 5.11, TO_DATE('2013-08-08', 'YYYY-MM-DD'));
INSERT INTO Tutorial VALUES (5, 'Order By Clause', 'SQL', 4.19, TO_DATE('2013-08-08', 'YYYY-MM-DD'));
INSERT INTO Tutorial VALUES (6, 'Functions', 'C', 5.23, TO_DATE('2013-04-04', 'YYYY-MM-DD'));

-- Create Tutorial_Info table
CREATE TABLE Tutorial_Info (
  tutorial_id INT PRIMARY KEY,
  views INT,
  likes INT,
  dislikes INT,
  shares INT
);

-- Insert rows into Tutorial_Info table
INSERT INTO Tutorial_Info VALUES (1, 15000, 54, 13, 6);
INSERT INTO Tutorial_Info VALUES (2, 12500, 43, 21, 2);
INSERT INTO Tutorial_Info VALUES (3, 17500, 31, 29, 12);
INSERT INTO Tutorial_Info VALUES (4, 16000, 17, 0, 11);
INSERT INTO Tutorial_Info VALUES (5, 85000, 117, 10, 19);
INSERT INTO Tutorial_Info VALUES (6, 112000, 191, 46, 34);

-- a. Display tutorial_id, title, duration, views, likes, and shares of each tutorial (LEFT OUTER JOIN so that each tutorial displayed)
SELECT Tutorial.id, Tutorial.title, Tutorial.duration, Tutorial_Info.views, Tutorial_Info.likes, Tutorial_Info.shares
FROM Tutorial
LEFT OUTER JOIN Tutorial_Info ON Tutorial.id = Tutorial_Info.tutorial_id;

-- b. Display the title of the tutorial disliked by more than 20 members (LEFT OUTER JOIN so that each tutorial is considered)
SELECT Tutorial.title
FROM Tutorial
LEFT OUTER JOIN Tutorial_Info ON Tutorial.id = Tutorial_Info.tutorial_id
WHERE Tutorial_Info.dislikes > 20;

-- c. Display the longest tutorial title with its number of views (RIGHT OUTER JOIN so that each tutorial is considered)
SELECT Tutorial.title, Tutorial_Info.views
FROM Tutorial_Info
RIGHT OUTER JOIN Tutorial ON Tutorial.id = Tutorial_Info.tutorial_id
WHERE Tutorial.duration = (SELECT MAX(duration) FROM Tutorial);

-- d. Display the title of the last uploaded tutorial with its number of shares (RIGHT OUTER JOIN so that each tutorial is considered)
SELECT Tutorial.title, Tutorial_Info.shares
FROM Tutorial_Info
RIGHT OUTER JOIN Tutorial ON Tutorial.id = Tutorial_Info.tutorial_id
WHERE Tutorial.upload_date = (SELECT MAX(upload_date) FROM Tutorial);

-- f. For each subject, sum up its duration along with its count
SELECT Tutorial.subject, SUM(Tutorial.duration) AS total_duration, COUNT(*) AS tutorial_count
FROM Tutorial
GROUP BY Tutorial.subject;

-- g. Display the title of the tutorial by adding its likes, views, shares, and subtracting dislikes (LEFT OUTER JOIN so that each tutorial is considered)
SELECT Tutorial.title, (Tutorial_Info.likes + Tutorial_Info.views + Tutorial_Info.shares - Tutorial_Info.dislikes) AS total_score
FROM Tutorial
LEFT OUTER JOIN Tutorial_Info ON Tutorial.id = Tutorial_Info.tutorial_id;


