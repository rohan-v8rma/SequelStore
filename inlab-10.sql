--
DROP TABLE employee;

-- Creating the table
CREATE TABLE employee (
  ID INT PRIMARY KEY,
  ENAME VARCHAR(50),
  SALARY INT
);

-- Inserting into table
INSERT INTO employee VALUES (1, 'James Potter', 75000);
INSERT INTO employee VALUES (2, 'Ethan McCarty', 90000);
INSERT INTO employee VALUES (3, 'Emily Rayner', 25000);
INSERT INTO employee VALUES (4, 'Jack Abraham', 30000);
INSERT INTO employee VALUES (5, 'Ayaz Mohammad', 40000);


-- Q1A. Insertion trigger
CREATE OR REPLACE TRIGGER insertion
BEFORE INSERT ON employee
DECLARE
    date_today DATE := SYSDATE();
BEGIN
    dbms_output.put_line(date_today);
END;
/

INSERT INTO employee VALUES (98, 'Rohan Verma', 10000);

-- Q1A. Deletion trigger
CREATE OR REPLACE TRIGGER deletion
BEFORE DELETE ON employee
DECLARE
    date_today DATE := SYSDATE();
BEGIN
    dbms_output.put_line(date_today);
END;
/

DELETE FROM employee WHERE id = 98;

-- Q1A. Updation trigger
CREATE OR REPLACE TRIGGER updation
BEFORE UPDATE ON employee
DECLARE
    date_today DATE := SYSDATE();
BEGIN
    dbms_output.put_line(date_today);
END;
/

UPDATE employee SET ename='ABC' WHERE id=1;

-- Q1B. Check if updation value difference is not more than 25000
CREATE OR REPLACE TRIGGER salary_diff_check
BEFORE UPDATE ON employee
FOR EACH ROW   
BEGIN
    IF (:NEW.SALARY - :OLD.SALARY) NOT BETWEEN -25000 AND 25000 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Salary difference constraint violated.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error occurred: ' || SQLERRM);
END;
/

UPDATE employee SET SALARY=SALARY+20000 WHERE id=1;
UPDATE employee SET SALARY=SALARY-25001 WHERE id=4;