-- 
DROP TABLE EMP;
DROP TABLE DEPT;


-- Create DEPT table
CREATE TABLE DEPT (
  DEPTNO NUMBER(2) PRIMARY KEY,
  DNAME  VARCHAR2(15),
  LOC    VARCHAR2(15)
);

-- Insert records into DEPT table
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');


-- Create EMP table
CREATE TABLE EMP (
  EMPNO   NUMBER(4) PRIMARY KEY,
  ENAME   VARCHAR2(10),
  HIREDATE DATE,
  MGR     NUMBER(4),
  SAL     NUMBER(6),
  DEPTNO  NUMBER(2),
  FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
  FOREIGN KEY (MGR) REFERENCES EMP (EMPNO)
);

-- Insert records into EMP table
INSERT INTO EMP VALUES (7839, 'KING', TO_DATE('17-NOV-81', 'DD-MON-YY'), NULL, 5000, 10);
INSERT INTO EMP VALUES (7698, 'BLAKE', TO_DATE('01-MAY-81', 'DD-MON-YY'), 7839, 2850, 30);
INSERT INTO EMP VALUES (7566, 'JONES', TO_DATE('02-APR-81', 'DD-MON-YY'), 7839, 2975, 20);
INSERT INTO EMP VALUES (7782, 'CLARK', TO_DATE('09-JUN-81', 'DD-MON-YY'), 7839, 2450, 10);
INSERT INTO EMP VALUES (7934, 'MILLER', TO_DATE('23-JAN-82', 'DD-MON-YY'), 7782, 1300, 10);
INSERT INTO EMP VALUES (7654, 'MARTIN', TO_DATE('28-SEP-81', 'DD-MON-YY'), 7698, 1250, 30);
INSERT INTO EMP VALUES (7844, 'TURNER', TO_DATE('08-SEP-81', 'DD-MON-YY'), 7698, 1500, 30);
INSERT INTO EMP VALUES (7499, 'ALLEN', TO_DATE('20-FEB-81', 'DD-MON-YY'), 7698, 1600, 30);
INSERT INTO EMP VALUES (7521, 'WARD', TO_DATE('22-FEB-81', 'DD-MON-YY'), 7698, 1250, 30);
INSERT INTO EMP VALUES (7900, 'JAMES', TO_DATE('03-DEC-81', 'DD-MON-YY'), 7698, 950, 30);
INSERT INTO EMP VALUES (7788, 'SCOTT', TO_DATE('19-APR-87', 'DD-MON-YY'), 7566, 3000, 20);
INSERT INTO EMP VALUES (7876, 'ADAMS', TO_DATE('23-MAY-87', 'DD-MON-YY'), 7788, 1100, 20);
INSERT INTO EMP VALUES (7902, 'FORD', TO_DATE('03-DEC-81', 'DD-MON-YY'), 7566, 3000, 20);
INSERT INTO EMP VALUES (7369, 'SMITH', TO_DATE('17-DEC-80', 'DD-MON-YY'), 7902, 800, 20);

-- Q1 (Selected only employee information using EMP.*)
SELECT EMP.* FROM
EMP 
INNER JOIN DEPT 
ON DEPT.DEPTNO = EMP.DEPTNO
AND DEPT.LOC = 'CHICAGO';

-- Q2 (Name of highest paid employee)
SELECT ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);

-- Q3 (If sub-query table returned multiple SAL values, it would result in error)
SELECT ENAME 
FROM EMP
WHERE SAL > (SELECT AVG(SAL) from EMP);
 
-- Q4 (If sub-query table returned multiple SAL values, it would result in error)
SELECT ENAME
FROM EMP
WHERE SAL = (SELECT SAL FROM EMP WHERE ENAME='FORD')
AND ENAME <> 'FORD';

-- Q5 (DEPT Name of highest paid employee)
SELECT DNAME
FROM DEPT
INNER JOIN (
    SELECT * 
    FROM EMP
    WHERE SAL = (SELECT MAX(SAL) FROM EMP)
) highest_paid_employee
ON DEPT.DEPTNO = highest_paid_employee.DEPTNO;

-- Q6 (we remove max salary before applying MAX function)
SELECT ENAME
FROM EMP
WHERE SAL = (
    SELECT MAX(SAL)
    FROM EMP
    WHERE SAL <> (SELECT MAX(SAL) FROM EMP)
);

-- Q7 (Employee working in the Location "BOSTON" or "DALLAS")
SELECT ENAME FROM
EMP 
INNER JOIN DEPT 
ON DEPT.DEPTNO = EMP.DEPTNO
AND (DEPT.LOC = 'BOSTON' OR DEPT.LOC = 'DALLAS');

-- Q8 (employee who are not working in the Location 'NEW YORK')
SELECT ENAME FROM
EMP 
INNER JOIN DEPT 
ON DEPT.DEPTNO = EMP.DEPTNO
AND DEPT.LOC <> 'NEW YORK';


-- Q9 (GROUP BY allows getting min salary of every department)
SELECT EMP.* FROM EMP
INNER JOIN (
    SELECT DEPTNO, MIN(SAL) AS dept_min_salary
    FROM EMP
    GROUP BY DEPTNO
) min_salaries
ON EMP.DEPTNO = min_salaries.DEPTNO
AND EMP.SAL > min_salaries.dept_min_salary;

-- Q10 (Employees having greater than or equal to the max salaries in their respective departments)
SELECT EMP.*
FROM EMP
INNER JOIN (
	SELECT DEPTNO, MAX(SAL) AS dept_max_salary
    FROM EMP
    GROUP BY DEPTNO
) max_salaries
ON EMP.DEPTNO = max_salaries.DEPTNO
AND EMP.SAL >= max_salaries.dept_max_salary;

-- Q11 (Finding average of averages using sub-query)
SELECT AVG(dept_avg_salary) 
FROM (
    SELECT DEPTNO, AVG(SAL) AS dept_avg_salary
    FROM EMP
    GROUP BY DEPTNO
);

-- Q12 (salary, avg salary and difference)
SELECT SAL, avg_salary, (SAL - avg_salary) AS diff_from_average_salary
FROM EMP, (
    SELECT DEPTNO, ROUND(AVG(SAL), 2) as avg_salary
    FROM EMP
    GROUP BY DEPTNO
) avg_salaries
WHERE avg_salaries.DEPTNO = EMP.DEPTNO;

-- Q13 (Used WHERE IN clause for shortlisting employees whose salaries need to be updated)
UPDATE EMP
SET SAL=1.1*SAL
WHERE EMPNO IN 
	(SELECT EMPNO FROM EMP
    INNER JOIN DEPT
    ON DEPT.DEPTNO = EMP.DEPTNO
    AND DEPT.DNAME = 'SALES');

-- Q15 (departments with min salary greater than 1000)
SELECT DNAME 
FROM DEPT
INNER JOIN (
    SELECT DEPTNO, MIN(SAL) as dept_min_sal
    FROM EMP
    GROUP BY DEPTNO    
) min_salaries
ON DEPT.DEPTNO = min_salaries.DEPTNO
AND min_salaries.dept_min_sal > 1000;
    
-- Q16 (Departments not having employees with salary greater than 10000)
SELECT DEPT.*
FROM DEPT
INNER JOIN (
    SELECT DEPTNO, MAX(SAL) as dept_max_sal
    FROM EMP
    GROUP BY DEPTNO    
) max_salaries
ON DEPT.DEPTNO = max_salaries.DEPTNO
AND max_salaries.dept_max_sal < 10000;

-- Q17 (Employees having jones as manager)
SELECT EMP.*
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'JONES');

-- Q18 (Selecting names of all managers)
SELECT ENAME AS names_of_managers
FROM EMP
WHERE EMPNO IN (SELECT MGR FROM EMP WHERE MGR IS NOT NULL);


-- Q19 (Departments having atleast 1 employee with salary greater than 10000)
SELECT DEPT.*
FROM DEPT
INNER JOIN (
    SELECT DEPTNO, MAX(SAL) as dept_max_sal
    FROM EMP
    GROUP BY DEPTNO    
) max_salaries
ON DEPT.DEPTNO = max_salaries.DEPTNO
AND max_salaries.dept_max_sal > 10000;

-- Q20 (Employees with salaries greater than avg of all departments)
SELECT *
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- Q14 (Deletes all rows so run at last.)
DELETE FROM EMP
WHERE EMPNO IN (
    SELECT EMPNO
    FROM EMP
    WHERE MONTHS_BETWEEN(EMP.HIREDATE, (SELECT SYSDATE FROM DUAL)) >= 30 * 12
);




