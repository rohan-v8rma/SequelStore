DROP TABLE employee;

--Q0, creating and entering the default records into the table.

CREATE TABLE employee (
  ID INT,
  ENAME VARCHAR(50),
  DOJ DATE,
  SALARY INT,
  BONUS INT,
  DEPT VARCHAR(10),
  DESIGNATION VARCHAR(10),
  MANAGER INT,
  COMPID INT
);

INSERT INTO employee VALUES (1, 'James Potter', TO_DATE('01-JUN-14', 'DD-MON-YY'), 75000, 1000, 'ICP', 'PM', NULL, 1001);
INSERT INTO employee VALUES (2, 'Ethan McCarty', TO_DATE('01-FEB-14', 'DD-MON-YY'), 90000, 1200, 'ETA', 'PM', NULL, NULL);
INSERT INTO employee VALUES (3, 'Emily Rayner', TO_DATE('01-JAN-14', 'DD-MON-YY'), 25000, 100, 'ETA', 'SE', 2, 1002);
INSERT INTO employee VALUES (4, 'Jack Abraham', TO_DATE('01-JUL-14', 'DD-MON-YY'), 30000, NULL, 'ETA', 'SSE', 2, NULL);
INSERT INTO employee VALUES (5, 'Ayaz Mohammad', TO_DATE('01-APR-14', 'DD-MON-YY'), 40000, NULL, 'ICP', 'TA', 1, 1003);
INSERT INTO employee VALUES (98, 'Rohan Verma', TO_DATE('06-MAY-23', 'DD-MON-YY'), 10000, 1300, 'ICP', 'SSE', 1, NULL);

--Q1

--1A

--All Columns
SELECT * FROM employee;
--Filter Columns
SELECT ID, ENAME, SALARY FROM employee;
--Alias without AS keyword
SELECT ID, ENAME Employee_Name FROM employee;
--Alias with AS keyword
SELECT ID, ENAME AS Employee_Name FROM employee;



--1B

--Duplicates
SELECT DEPT FROM employee;
--Distinct - Single Column
SELECT DISTINCT DEPT FROM employee;
--Distinct - Multiple Column
SELECT DISTINCT DEPT, DESIGNATION FROM employee;
--Distinct - Incorrect Usage
SELECT DISTINCT FROM employee;
--DISTINCT NULL
SELECT DISTINCT MANAGER FROM employee;


--Q2

--IN
SELECT * FROM employee WHERE DESIGNATION IN ('PM');

--IN with duplicates
SELECT * FROM employee WHERE MANAGER IN (1, 1);

--NOT IN
SELECT * FROM employee WHERE DESIGNATION NOT IN ('PM', 'SE', 'SSE');

--= NULL
SELECT * FROM employee WHERE BONUS = NULL;

--IS NULL
SELECT * FROM employee WHERE BONUS IS NULL;

--IS NOT NULL
SELECT * FROM employee WHERE COMPID IS NOT NULL;


--Q3

--IN
SELECT * FROM employee WHERE DESIGNATION IN ('PM');

--IN with duplicates
SELECT * FROM employee WHERE MANAGER IN (1, 1);

--NOT IN
SELECT * FROM employee WHERE DESIGNATION NOT IN ('PM', 'SE', 'SSE');

--= NULL
SELECT * FROM employee WHERE BONUS = NULL;

--IS NULL
SELECT * FROM employee WHERE BONUS IS NULL;

--IS NOT NULL
SELECT * FROM employee WHERE COMPID IS NOT NULL;

--IN NULL
SELECT * FROM employee WHERE MANAGER IN (NULL, 1);

--Q4

--CHAR
SELECT * FROM employee WHERE ENAME = 'James Potter';

--CHAR with trailing spaces
SELECT * FROM employee WHERE ENAME = 'James Potter ';

--CHAR with leading spaces
SELECT * FROM employee WHERE ENAME = ' James Potter';

--VARCHAR2
SELECT * FROM employee WHERE DEPT = 'ICP';

--VARCHAR2 with trailing spaces
SELECT * FROM employee WHERE DEPT = 'ICP ';

--VARCHAR2 with leading spaces
SELECT * FROM employee WHERE DEPT = ' ICP';

--Q5

--Start Pattern
SELECT * FROM employee WHERE ENAME LIKE 'A%';
--End Pattern
SELECT * FROM employee WHERE ENAME LIKE '%Mohammad';
--Anywhere Pattern
SELECT * FROM employee WHERE ENAME LIKE '%Abra%';
--Dates End Pattern
SELECT * FROM employee WHERE DOJ LIKE '%JUL-14';
--Fixed Pattern
SELECT * FROM employee WHERE DESIGNATION LIKE 'TA';
--Mixed Pattern
SELECT * FROM employee WHERE ENAME LIKE 'Ayaz M%';


--Q6

--Table Name incorrect
SELECT * FROM emploee;
--Column name incorrect
SELECT ENAMEE, DEPTT FROM employee;
--WHERE condition incorrect
SELECT * FROM employee WHERE SALAR > 30000;
--WHERE condition correct
SELECT * FROM employee WHERE SALARY > 30000;

--Q7

--Date with Addition and Subtraction
SELECT ENAME, DOJ, DOJ + 7 as new_date FROM employee;

--Months between dates
SELECT MONTHS_BETWEEN(TO_DATE('06-MAY-2023', 'DD-MON-YYYY'), DOJ) AS MONTHS_WORKED FROM employee;

--Add months
SELECT ADD_MONTHS(DOJ, 12) AS ADDED_MONTHS FROM employee;

--Next Day
SELECT NEXT_DAY(DOJ, 'FRIDAY') AS NEXT_PAY_DAY FROM employee;

--LastDay
SELECT LAST_DAY(DOJ) AS LAST_PAY_DAY FROM employee;

--To_CHAR function
SELECT TO_CHAR(DOJ, 'DD-MON-YYYY') AS JOINING_DATE FROM employee;

--To_Date function
SELECT TO_DATE('01-JAN-2023', 'DD-MON-YYYY') AS NEW_YEAR_2023 FROM dual; 
-- The dual table in Oracle is a special one-row, one-column table that is commonly used in SQL queries when no table is available. It is used as a dummy table to provide a single row for performing calculations or executing functions

