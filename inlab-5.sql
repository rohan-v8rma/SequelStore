--
CREATE TABLE Student_Details (
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Course VARCHAR(50)
);

--
INSERT INTO Student_Details (ID, Name, Course)
VALUES (1041, 'Sara', 'Java');

INSERT INTO Student_Details (ID, Name, Course)
VALUES (1204, 'Aryan', 'C++');

INSERT INTO Student_Details (ID, Name, Course)
VALUES (1043, 'Sameer', 'Python');

INSERT INTO Student_Details (ID, Name, Course)
VALUES (1032, 'Abhijeet', 'Oracle');

--
CREATE TABLE Students_Marks (
  ID INT PRIMARY KEY,
  Marks INT
);

--
INSERT INTO Students_Marks (ID, Marks)
VALUES (1041, 65);

INSERT INTO Students_Marks (ID, Marks)
VALUES (1204, 55);

INSERT INTO Students_Marks (ID, Marks)
VALUES (1043, 73);

INSERT INTO Students_Marks (ID, Marks)
VALUES (1032, 62);


-- 
ALTER TABLE Students_Marks
ADD CONSTRAINT FK_StudentDetails_ID_NULL
FOREIGN KEY (ID)
REFERENCES Student_Details(ID)
ON DELETE SET NULL;

DELETE FROM Student_Details
WHERE ID = 1032;

SELECT * FROM Students_Marks;

--
ALTER TABLE Students_Marks
DROP CONSTRAINT FK_StudentDetails_ID_NULL;

ALTER TABLE Students_Marks
ADD CONSTRAINT FK_StudentDetails_ID
FOREIGN KEY (ID)
REFERENCES Student_Details(ID)
ON DELETE CASCADE;


DELETE FROM Student_Details
WHERE ID = 1041;

SELECT * FROM Students_Marks;
