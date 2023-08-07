# INDEX

- [INDEX](#index)
- [Important points for PL/SQL](#important-points-for-plsql)
- [`ALTER TABLE` snippets](#alter-table-snippets)
  - [Commands that require `COLUMN` suffix](#commands-that-require-column-suffix)
  - [Commands that don't require `COLUMN` suffix](#commands-that-dont-require-column-suffix)
- [Syntax for foreign key](#syntax-for-foreign-key)
  - [Composite foreign keys](#composite-foreign-keys)
- [`HAVING` and `GROUP BY`](#having-and-group-by)
- [Correlated Sub-query Examples](#correlated-sub-query-examples)
  - [Example 1](#example-1)
  - [Example 2](#example-2)
  - [Example 3](#example-3)
- [Working with Date and Time in Oracle SQL](#working-with-date-and-time-in-oracle-sql)
- [PL SQL](#pl-sql)
  - [DECLARE section](#declare-section)
    - [Syntax for variable declaration](#syntax-for-variable-declaration)
    - [`%type` declaration](#type-declaration)
    - [`%rowtype` declaration](#rowtype-declaration)
  - [Displaying output](#displaying-output)
  - [Executable section (between BEGIN and END)](#executable-section-between-begin-and-end)
  - [`SELECT INTO` clause](#select-into-clause)
  - [PL SQL Operator Precedence](#pl-sql-operator-precedence)
  - [Conditional Statements](#conditional-statements)
    - [`IF-THEN` statement](#if-then-statement)
    - [`IF-THEN-ELSE` statement](#if-then-else-statement)
    - [`IF-THEN-ELSIF` statement](#if-then-elsif-statement)
    - [`CASE` statement](#case-statement)
    - [Nested `IF-THEN-ELSE` statement](#nested-if-then-else-statement)
  - [Looping statements](#looping-statements)
    - [For-loop](#for-loop)
    - [While-loop](#while-loop)
  - [Sub-programs](#sub-programs)
    - [Procedures](#procedures)
    - [Functions](#functions)
  - [Cursors](#cursors)
    - [1. Implicit Cursors](#1-implicit-cursors)
    - [2. Explicit Cursors](#2-explicit-cursors)
  - [Triggers \& Exceptions](#triggers--exceptions)
    - [Undeclared Exceptions](#undeclared-exceptions)
    - [Custom declared exceptions](#custom-declared-exceptions)

# Important points for PL/SQL

- Write commands first in a 
- Execute SET SERVEROUTPUT ON to ensure output is visible

---

# `ALTER TABLE` snippets

## Commands that require `COLUMN` suffix

```sql
-- DROP a column
ALTER TABLE Player DROP COLUMN age;
DESC Player;

-- Rename a column
ALTER TABLE Player RENAME COLUMN player_id TO pid;
```

## Commands that don't require `COLUMN` suffix

```sql
-- Rename the table
ALTER TABLE Player RENAME TO Players;

-- MODIFY a column
ALTER TABLE Player MODIFY goals INT DEFAULT 0;
DESC Player;

ALTER TABLE Player ADD age INT;
DESC Player;
```

---

# Syntax for foreign key

CREATE TABLE FREQUENTS (
  NAME VARCHAR2(30) PRIMARY KEY,
  FOREIGN KEY(NAME) REFERENCES PERSON(NAME),
)

## Composite foreign keys

If a table has a composite primary key, example: (name, age),
name and age have to be referenced as foreign key together, not separately.

# `HAVING` and `GROUP BY`

GROUP BY is always needed whenever we need to use the HAVING clause.

HAVING clause is for directly using aggregate functions in condition: HAVING COUNT(*) > 1
Where clause is used when we want to use aggregate functions in an indirect way: WHERE price = (select min(price) from items)

# Correlated Sub-query Examples

## Example 1

Get all employees whose salary is higher than the average salary in their department.

```sql
SELECT emp_name, salary, department
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
```

In this example, the subquery calculates the average salary for each department and compares it with the salary of each employee in the outer query.

## Example 2

Find customers who have made more than one order.

```sql
SELECT customer_name
FROM customers c
WHERE (
    SELECT COUNT(*)
    FROM orders
    WHERE customer_id = c.customer_id
) > 1;
```

In this example, the subquery counts the number of orders for each customer in the outer query and returns only those customers who have made more than one order.

## Example 3

Retrieve employees whose hire date is later than the hire date of their manager.

```sql
SELECT emp_name, hire_date, manager_id
FROM employees e
WHERE hire_date > (
    SELECT hire_date
    FROM employees
    WHERE emp_id = e.manager_id
);
```

In this example, the subquery fetches the hire date of the manager for each employee in the outer query and filters out employees whose hire date is later than their manager's hire date.

Correlated subqueries are useful when you need to perform row-by-row comparisons or when the subquery depends on values from the outer query.

# Working with Date and Time in Oracle SQL

| Name |	Description |
|-|-|
| `CURRENT_DATE()` | Return the current date |
| `CURRENT_TIME()` | Return the current time |
| `DATE()` | Extract the date part of a date or datetime expression |
| `DATEDIFF()` | Subtract two dates |
| `HOUR()` | Extract the hour |
| `MINUTE()` | Return the minute from the argument |
| `MONTH()` | Return the month from the date passed |
| `NOW()` | Return the current date and time |
| `SEC_TO_TIME()` | Converts seconds to 'hh:mm:ss' format |
| `SECOND()` | Return the second (0-59) |
| `TO_DATE()` | Convert a string to a date. `TO_DATE('01-JUN-14', 'DD-MON-YY')` |
| `SYSDATE()` | Return the time at which the function executes |
| `TIME()` | Extract the time portion of the expression passed |
| `TIMEDIFF()` | Subtract time |
| `TO_DAYS()` | Return the date argument converted to days |
| `TO_SECONDS()` | Return the date or datetime argument converted to seconds since Year 0 |
| `WEEK()` | Return the week number |
| `WEEKDAY()` | Return the weekday index |
| `YEAR()` | Return the year |

# PL SQL

## DECLARE section
  
- Optional
- Variables defined here.
  
### Syntax for variable declaration

  - variable_name [CONSTANT] datatype [NOT NULL] [:= | DEFAULT initial_value] 
  - x CONSTANT int NOT NULL DEFAULT 2
  - y varchar2(20) := 'hello world'

### `%type` declaration

- The `%type` syntax in PL/SQL is used to declare a variable with the same data type as a specific column in a table. 

  For example:
  ```sql
  DECLARE
    c_id customers.id%type := 1; 
    c_name  customers.name%type; 
    c_addr customers.address%type; 
    c_sal  customers.salary%type; 
  ```

- In the provided code snippet, `%type` is used to declare variables `c_name`, `c_addr`, `c_sal` with the same data types as the respective columns `name`, `address`, and `salary` in the `customers` table.

- By using `%type`, you ensure that the declared variables have the same data type as the corresponding table columns. 
  
  This provides type safety and avoids potential data type inconsistencies in your PL/SQL code. 

- If the data type of the table column changes, the variables declared using `%type` will automatically update to match the new data type, ensuring compatibility between the variables and the table structure.

### `%rowtype` declaration

```sql
DECLARE 
   customer_rec customers%rowtype; 
BEGIN 
   SELECT * into customer_rec 
   FROM customers 
   WHERE id = 5;  
   dbms_output.put_line('Customer ID: ' || customer_rec.id); 
   dbms_output.put_line('Customer Name: ' || customer_rec.name); 
   dbms_output.put_line('Customer Address: ' || customer_rec.address); 
   dbms_output.put_line('Customer Salary: ' || customer_rec.salary); 
END; 
/
```

---

## Displaying output

- `dbms_output.put_line()` used for displaying output. 
- `||` is used for concatenating strings enclosed in '' and variables, like this:

  ```sql
  dbms_output.put_line('this is value of c:' || c);
  ```

---

## Executable section (between BEGIN and END)

- Mandatory

## `SELECT INTO` clause

```sql
DECLARE 
   c_id customers.id%type := 1; 
   c_name  customers.name%type; 
   c_addr customers.address%type; 
   c_sal  customers.salary%type; 
BEGIN 
   SELECT name, address, salary INTO c_name, c_addr, c_sal 
   FROM customers 
   WHERE id = c_id;  
   dbms_output.put_line('Customer ' ||c_name || ' from ' || c_addr || ' earns ' || c_sal); 
END; 
```

The above code will display the information of only one customer that matches the condition in the WHERE clause (`id = c_id`). 

If multiple customers have the same `id` value as `c_id`, the SELECT statement will still retrieve data only for the first matching row. 

The code does not handle multiple matches or iterate through multiple results.

## PL SQL Operator Precedence

![](pl-sql-operator-precedence.png)

## Conditional Statements

### `IF-THEN` statement

- Example 1:
  ```sql
  DECLARE 
   a number(2) := 10; 
  BEGIN 
    a:= 10; 
    -- check the boolean condition using if statement  
    IF( a < 20 ) THEN 
        -- if condition is true then print the following   
        dbms_output.put_line('a is less than 20 ' ); 
    END IF; 
    dbms_output.put_line('value of a is : ' || a); 
  END; 
  /
  ```

- Example 2:
  ```sql
  DECLARE 
   c_id customers.id%type := 1; 
   c_sal  customers.salary%type; 
  BEGIN
    SELECT salary  
    INTO  c_sal 
    FROM customers 
    WHERE id = c_id; 
    IF (c_sal <= 2000) THEN 
        UPDATE customers  
        SET salary =  salary + 1000 
          WHERE id = c_id; 
        dbms_output.put_line ('Salary updated'); 
    END IF; 
  END; 
  /
  ```

### `IF-THEN-ELSE` statement

Example:
```sql
DECLARE 
   a number(3) := 100; 
BEGIN 
   -- check the boolean condition using if statement  
   IF( a < 20 ) THEN 
      -- if condition is true then print the following   
      dbms_output.put_line('a is less than 20 ' ); 
   ELSE 
      dbms_output.put_line('a is not less than 20 ' ); 
   END IF; 
   dbms_output.put_line('value of a is : ' || a); 
END; 
/
```

### `IF-THEN-ELSIF` statement

```sql
DECLARE 
   a number(3) := 100; 
BEGIN 
   IF ( a = 10 ) THEN 
      dbms_output.put_line('Value of a is 10' ); 
   ELSIF ( a = 20 ) THEN 
      dbms_output.put_line('Value of a is 20' ); 
   ELSIF ( a = 30 ) THEN 
      dbms_output.put_line('Value of a is 30' ); 
   ELSE 
       dbms_output.put_line('None of the values is matching'); 
   END IF; 
   dbms_output.put_line('Exact value of a is: '|| a );  
END; 
/ 
```

### `CASE` statement

```sql
DECLARE 
   grade char(1) := 'A'; 
BEGIN 
   CASE grade 
      when 'A' then dbms_output.put_line('Excellent'); 
      when 'B' then dbms_output.put_line('Very good'); 
      when 'C' then dbms_output.put_line('Well done'); 
      when 'D' then dbms_output.put_line('You passed'); 
      when 'F' then dbms_output.put_line('Better try again'); 
      else dbms_output.put_line('No such grade'); 
   END CASE; 
END; 
/
```

### Nested `IF-THEN-ELSE` statement

```sql
DECLARE 
   a number(3) := 100; 
   b number(3) := 200; 
BEGIN 
   -- check the boolean condition  
   IF( a = 100 ) THEN 
   -- if condition is true then check the following  
      IF( b = 200 ) THEN 
      -- if condition is true then print the following  
      dbms_output.put_line('Value of a is 100 and b is 200' ); 
      END IF; 
   END IF; 
   dbms_output.put_line('Exact value of a is : ' || a ); 
   dbms_output.put_line('Exact value of b is : ' || b ); 
END; 
/ 
```

---

## Looping statements

- LOOP keyword denotes start of looping block.

### For-loop

```sql
DECLARE 
   i number(1); 
   j number(1); 
BEGIN 
 
   FOR i IN 1..3 LOOP 
      FOR j IN 1..3 LOOP 
         dbms_output.put_line('i is: '|| i || ' and j is: ' || j); 
      END LOOP; 
   END LOOP; 
END; 
/
```

### While-loop

```sql
DECLARE
   counter NUMBER := 1;
BEGIN
   LOOP
      -- Print the current value of counter
      dbms_output.put_line('Counter: ' || counter);
      
      counter := counter + 1;
      
      -- Exit the loop when counter reaches 6
      EXIT WHEN counter > 5;
   END LOOP;
END;
```

---

## Sub-programs

- Procedures and Functions are known as Sub-programs in PL SQL. 
- Only difference is that functions have a return value, while procedures don't.
  
  Although procedures can still return a value, albeit indirectly using OUT parameters.
- The use of `IS` or `AS` keyword is purely based on preference. 
  
  Variable declarations come after `IS`/`AS` and before the `BEGIN` clause.

### Procedures

1. Creating a Procedure:
    ```sql
    CREATE [OR REPLACE] PROCEDURE procedure_name 
    [(parameter_name [IN | OUT | IN OUT] type [, ...])] 
    {IS | AS} 
    -- Variable declarations over here.
    BEGIN 
      < procedure_body > 
    END [procedure_name]; 
    ```
2. Dropping a Procedure:
    ```sql
    DROP PROCEDURE procedure-name;
    ```


### Functions

1. Creating a Function:
    ```sql
    CREATE [OR REPLACE] FUNCTION function_name 
    [(parameter_name [IN | OUT | IN OUT] type [, ...])] 
    RETURN return_datatype 
    {IS | AS} 
    -- Variable declarations over here.
    BEGIN 
      < function_body > 
    END [function_name];
    ```

2. Dropping a Function:
    ```sql
    DROP FUNCTION function-name;
    ```

## Cursors

Oracle creates a memory area, known as the context area, for processing an SQL statement, which contains all the information needed for processing the statement; for example, the number of rows processed, etc.

A cursor is a pointer to this context area. PL/SQL controls the context area through a cursor. A cursor holds the rows (one or more) returned by a SQL statement. The set of rows the cursor holds is referred to as the active set.

A cursor provides a way to iterate over the result set and perform operations on each row individually. It allows you to fetch one or more rows from the result set, process them, and then move to the next row until all rows have been processed.

Cursors are particularly useful when you need to perform operations on a set of data that cannot be easily achieved with a single SQL statement or when you want to process data row by row. They provide a mechanism for fetching and processing data in a controlled manner.

There are two types of cursors in PL/SQL:

### 1. Implicit Cursors

Implicit cursors are automatically created by the PL/SQL engine for each SQL statement executed in a PL/SQL block. They are used for simple, one-time queries and do not require explicit declaration or management by the programmer.

Whenever a DML statement (INSERT, UPDATE and DELETE) is issued, an implicit cursor is associated with this statement. 

- For INSERT operations, the cursor holds the data that needs to be inserted. 
- For UPDATE and DELETE operations, the cursor identifies the rows that would be affected.

In PL/SQL, you can refer to the most recent implicit cursor as the SQL cursor, which always has attributes such as %FOUND, %ISOPEN, %NOTFOUND, and %ROWCOUNT,

| S.No | Attribute    | Description |
|-|-|-|
| 1    | %FOUND       | Returns TRUE if an INSERT, UPDATE, or DELETE statement affected one or more rows or a SELECT INTO statement returned one or more rows. Otherwise, it returns FALSE. |
| 2    | %NOTFOUND    | The logical opposite of %FOUND. It returns TRUE if an INSERT, UPDATE, or DELETE statement affected no rows, or a SELECT INTO statement returned no rows. Otherwise, it returns FALSE. |   
| 3    | %ISOPEN      | Always returns FALSE for implicit cursors, because Oracle closes the SQL cursor automatically after executing its associated SQL statement.     |
| 4    | %ROWCOUNT    | Returns the number of rows affected by an INSERT, UPDATE, or DELETE statement, or returned by a SELECT INTO statement. |


### 2. Explicit Cursors

Explicit cursors are explicitly declared and managed by the programmer. They provide more control and flexibility over the result set. You can define an explicit cursor, open it, fetch rows from it, and close it as needed. Explicit cursors are typically used when you need to perform complex operations or when you want to fetch and process data row by row.

The basic steps involved in using an explicit cursor are as follows:

1. Declare the cursor: Define the cursor by giving it a name and specifying the SELECT statement that defines the result set.

2. Open the cursor: Open the cursor to establish the result set.

3. Fetch rows from the cursor: Retrieve one or more rows from the result set into variables or records.

4. Process the fetched rows: Perform operations on the fetched data.

5. Close the cursor: Close the cursor when you are done processing the result set.

Here's an example of using an explicit cursor to fetch and process rows from a result set:

```sql
DECLARE
   CURSOR c_employees IS
      SELECT employee_id, first_name, last_name
      FROM employees
      WHERE department_id = 100;
      
   v_employee_id employees.employee_id%TYPE;
   v_first_name employees.first_name%TYPE;
   v_last_name employees.last_name%TYPE;
BEGIN
   OPEN c_employees;
   
   LOOP
      FETCH c_employees INTO v_employee_id, v_first_name, v_last_name;
      
      EXIT WHEN c_employees%NOTFOUND;
      
      -- Process the fetched data
      dbms_output.put_line('Employee ID: ' || v_employee_id);
      dbms_output.put_line('First Name: ' || v_first_name);
      dbms_output.put_line('Last Name: ' || v_last_name);
   END LOOP;
   
   CLOSE c_employees;
END;
```

In this example, an explicit cursor named `c_employees` is declared to select employee details from the `employees` table for a specific department. The cursor is opened, and then a loop is used to fetch and process each row from the result set. Finally, the cursor is closed to release the associated resources.


## Triggers & Exceptions

```sql
CREATE [OR REPLACE ] TRIGGER trigger_name  
{BEFORE | AFTER | INSTEAD OF }  
{INSERT [OR] | UPDATE [OR] | DELETE}  
[OF col_name]  
ON table_name  
[REFERENCING OLD AS o NEW AS n]  
[FOR EACH ROW]  
WHEN (condition)   
DECLARE 
   Declaration-statements 
BEGIN  
   Executable-statements 
EXCEPTION 
   Exception-handling-statements 
END; 
```

### Undeclared Exceptions

```sql
CREATE OR REPLACE TRIGGER book_trigger
-- This means we perform the check before inserting/updating the received data.
BEFORE INSERT OR UPDATE ON book
-- Perform this check for each row of the inserted data.
FOR EACH ROW
DECLARE
  req_count INT;
BEGIN
  IF :new.editor IS NOT NULL THEN
    SELECT COUNT(author_id) INTO req_count
    FROM author
    WHERE author_id = :new.editor;

    IF req_count = 0 THEN 
      -- We can use this method to raise exceptions without declaring them.
      RAISE_APPLICATION_ERROR(-20002, 'Invalid editor value');
    END IF;
  END IF;
EXCEPTION
  -- This is for catching any undeclared errors.
  WHEN OTHERS THEN
    -- SQLERRM is the message with which the error was raised
    dbms_output.put_line('An error occurred: ' || SQLERRM);
END;
/
```

### Custom declared exceptions

```sql
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
      -- Raising the declared exception
      RAISE trigger_exception;
    END IF;
  END IF;
EXCEPTION
  -- Handling the declared Exception
  WHEN trigger_exception THEN
    dbms_output.put_line('The editor value is NOT valid');
END;
/
```