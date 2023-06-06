-- 
DROP TABLE Employees;

-- Create Employees table. `manager_id` is FOREIGN KEY so that it doesn't take values other than ones in `id` column
CREATE TABLE Employees (
  id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  manager_id INT,
  FOREIGN KEY (manager_id) REFERENCES Employees(id)
);

-- Insert rows into Employees table
INSERT INTO Employees VALUES (1, 'John', NULL);
INSERT INTO Employees VALUES (2, 'Alice', 1);
INSERT INTO Employees VALUES (3, 'Bob', 1);
INSERT INTO Employees VALUES (4, 'Eva', 2);
INSERT INTO Employees VALUES (5, 'Michael', 2);
INSERT INTO Employees VALUES (6, 'Sarah', 3);

-- Displaying all Employee details
SELECT * FROM Employees;

-- Displaying names of employees along with their managers. NVL function to replace NULL values with a default value.
SELECT 
    e1.id as Employee_ID, 
    e1.emp_name as Employee_Name, 
    NVL(e2.emp_name, 'NO MANAGER ASSIGNED') as Manager_Name
FROM Employees e1
LEFT OUTER JOIN Employees e2 ON e1.manager_id = e2.id
ORDER BY e1.id; 
