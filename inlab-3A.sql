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

INSERT INTO employee VALUES (1, 'James Potter', '01-JUN-14', 75000, 1000, 'ICP', 'PM', NULL, 1001);
INSERT INTO employee VALUES (2, 'Ethan McCarty', '01-FEB-14', 90000, 1200, 'ETA', 'PM', NULL, NULL);
INSERT INTO employee VALUES (3, 'Emily Rayner', '01-JAN-14', 25000, 100, 'ETA', 'SE', 2, 1002);
INSERT INTO employee VALUES (4, 'Jack Abraham', '01-JUL-14', 30000, NULL, 'ETA', 'SSE', 2, NULL);
INSERT INTO employee VALUES (5, 'Ayaz Mohammad', '01-APR-14', 40000, NULL, 'ICP', 'TA', 1, 1003);

--Q1
SELECT SUM(SALARY) AS TotalSalary FROM employee;
--Q2
SELECT DEPT, COUNT(*) AS EmployeeCount 
FROM employee 
GROUP BY DEPT;
--Q3
SELECT DEPT, COUNT(*) AS EmployeeCount, GROUP_CONCAT(ENAME) AS EmployeeNames 
FROM employee 
GROUP BY DEPT;
--Q4
SELECT DEPT, DESIGNATION, MAX(SALARY) AS MaxSalary 
FROM employee 
GROUP BY DEPT, DESIGNATION;
--Q5
SELECT DEPT, MIN(SALARY) AS MinSalary, MAX(SALARY) AS MaxSalary, AVG(SALARY) AS AvgSalary FROM employee GROUP BY DEPT;
--Q6
SELECT DEPT, SUM(MaxSalary) AS TotalMaxSalary 
FROM (
  SELECT DEPT, DESIGNATION, MAX(SALARY) AS MaxSalary 
  FROM employee 
  GROUP BY DEPT, DESIGNATION
) AS MaxSalaries 
GROUP BY DEPT;

--Q7
SELECT MANAGER, COUNT(*) AS EmployeeCount
FROM employee 
GROUP BY MANAGER;
--Q8
SELECT DEPT, SUM(SALARY) AS TotalSalary
FROM employee 
GROUP BY DEPT;
--Q9
SELECT DEPT, SUM(SALARY) AS TotalSalary
FROM employee 
GROUP BY DEPT 
HAVING SUM(SALARY) > 90000;
--Q10
SELECT DEPT, AVG(SALARY) AS AvgSalary 
FROM employee 
GROUP BY DEPT 
HAVING COUNT(*) > 0;
--Q11


--Aggregate functions cannot be used in WHERE clause:
SELECT *
FROM employee
WHERE SUM(salary) > 50000;

-- Aggregate functions cannot be used in WHERE clause even if GROUP BY is used:
SELECT * FROM employee
GROUP BY dept
WHERE SUM(salary) > 50000;

-- Nested aggregate function cannot be used in SELECT clause without GROUP BY clause:
SELECT dept, SUM(AVG(salary))
FROM employee;

-- Order by cannot be used on columns in which grouping is not being done
SELECT dept, SUM(salary)
FROM employee
ORDER BY salary;


--Q12
SELECT DEPT, AVG(SALARY) AS AVG_SALARY
FROM employee
GROUP BY DEPT
ORDER BY AVG_SALARY DESC;
--Q13
SELECT DEPT
FROM employee
GROUP BY DEPT
HAVING COUNT(*) > 1;
--Q14
SELECT DEPT, MIN(SALARY), MAX(SALARY)
FROM employee
GROUP BY DEPT
HAVING MIN(SALARY) < 5000 AND MAX(SALARY) > 15000;


