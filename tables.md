# Inlab

## Inlab 2 and 3A

| ID | ENAME  | DOJ |  SALARY | BONUS | DEPT | DESIGNATION | MANAGER | COMPID |
|-|-|-|-|-|-|-|-|-|
| 1 | James Potter | 01-Jun-14 | 75000 | 1000 | ICP | PM | NULL | 1001 |
| 2 | Ethan McCarty | 01-Feb-14 | 90000 | 1200 | ETA | PM | NULL | NULL |
| 3 | Emily Rayner | 01-Jan-14 | 25000 | 100 | ETA | SE | 2 | 1002 |
| 4 | Jack Abraham | 01-Jul-14 | 30000 | NULL | ETA | SSE | 2 | NULL |
| 5 | Ayaz Mohammad | 01-Apr-14 | 40000 | NULL | ICP | TA | 1 | 1003 |

## Inlab 3B

| QuotationId | SupplierId | ItemCode |  QuotedPrice |
|-|-|-|-|
| Q1001 | S1001 | I1012 | 1500 |
| Q1002 | S1002 | I1012 | 1400 |
| Q1003 | S1003 | I1013 | 1450 |
| Q1004 | S1004 | I1012 | 600 |
| Q1005 | S1005 | I1013 | 625 |


Execute SQL command on the following table called 'Quotation'

| QuotationId | SupplierId | ItemCode |  QuotedPrice |
|-|-|-|-|
| Q1001 | S1001 | I1012 | 1500 |
| Q1002 | S1002 | I1012 | 1400 |
| Q1003 | S1003 | I1013 | 1450 |
| Q1004 | S1004 | I1012 | 600 |
| Q1005 | S1005 | I1013 | 625 |

A. For each item code count the number of quotation received
B. For each Itemcode, calculate the sum of quotation price
C. What is the minimum quoted price for each itemcode.
D. How many quotations were received from each supplier
E. What is the maximum amount quoted by each supplier
F. For each of the item of every supplier , count the number of quotations recieved

2. Use Group By clause to get department wise employee count.
3. Group By converts the entire rows in a group into a single row in result. You cannot fetch details from individual rows in a category. Let us try to fetch count and names of employees in each department.
4. Group By can also be used with multiple columns. In that case it treats each distinct combination of the columns as a single category. Let us display maximum salary paid to each designation, within each department.
5. You can use multiple aggregate functions in the same query as long as category for grouping is the same
6. You can nest aggregate functions up to maximum of 2 levels using Group By clause.
7. You can use GROUP BY with columns that contain NULL values. Aggregate function for NULL value is also computed along with aggregates for other values
8. Write a query to display the department and the total salary paid in each department.
9. Write a query to display the department and the total salary paid in each department whereas the total salary of such department should be greater than 90000.
10. Write a query to display the department and the average salary paid in each department whereas the at-least one employee works for the department.
11. Prove the following statements with an example query (erroneous)
 A. Aggregate functions cannot be used in WHERE clause.
 B. Aggregate functions cannot be used in WHERE clause even if GROUP BY is used.
 C. Nested aggregate function cannot be used in SELECT clause without GROUP BY clause.
 D. Order By cannot be used on columns on which Grouping is not being done. 
12.  Given the employee table as input, write the query that displays department wise average salaries sorted in descending order.
13.  Write query displays departments that have more than 1 employees?
14.  Write statement that shows the department ID, minimum salary, and maximum salary paid in that department, only if the minimum salary is less than 5000 and the maximum salary is more than 15000?

## Inlab 4A

Create the tables based on the conditions following them:

Sales table:

| SALE_ID | SALE_AMOUNT | VENDOR_NAME |  SALE_DATE | PROFIT |
|-|-|-|-|-|
| 123 | 100 | ABC | 01-12-2018 | 20 |
| 234 | 200 | BCD | 14-06-2019 | 55 |
| 345 | 500 | CDE | 22-03-2020 | 32 |
| 456 | 100 | DEF | 25-04-2021 | 40 |

Sales Person table:

| SALES_PERSON_ID | SALE_PERSON_NAME | SALES_PERSON_LOCATION |  SALE_ID |
|-|-|-|-|-|
| 1 | RAHUL| Kolkata | 234 |
| 2 | SWETA | Mumbai | 456 |
| 3 | ATUL | New Delhi | 123 |
| 4 | SHRUTI | Mumbai | 345 |


1. create a NOT NULL constraint in the columns ‘Sale_Id’, ‘Sale_Amount’ and ‘Vendor_Name’ when the table ‘Sales’ is created.
2. Create an UNIQUE constraint in the columns ‘Sale_Id’ when the table ‘Sales’ is created
3. Create a CHECK constraint on the column ‘Vendor_Name’ when the table ‘Sales’ is created and enforce a rule that sales made to a certain vendor ‘ABC’ should not be entered into the ‘Sales’ table
4. Create a default constraint on column name so that the default value should be “VIT, Vellore”
5. Create a PRIMARY KEY on the ‘Sale_Id’ column when the ‘Sales’ table is created
6. Name a UNIQUE constraint as ‘cusalesidamt’, and to define a UNIQUE constraint on multiple columns(Sale_Id,Sale_Amount)
7. Name a CHECK constrain ccheckprof, and for defining a CHECK constraint on multiple columns such that the rule for the vendor ‘ABC’, the business only wants sales with a profit greater than 500 to be recorded in the ‘Sales’ table
8. Naming of a PRIMARY KEY constraint and for defining a PRIMARY KEY constraint on multiple columns (Sale_Id, Sale_Amount)
9. Create a sample constraints with name and try to disable it , Test it and enable it again
10. Create foreign key The ‘Sale_Id’ column in the ‘Sales_person’ table refers to the 
‘Sale_Id’ in the ‘Sales’ table. 
11.  After the creation of sales table, add a constraint that the profit column cannot be null.
12.  Alter a DEFAULT Constraint of vendor name after the Creation of a Table with “VIT,Chennai”

## Inlab 4B

13. Consider the following table and apply the concept of referential integrity over the tables using Foreign key. Check the options of ON DELETE/UPDATE CASCADE and ON DELETE/UPDATE SET NULL.


Persons table:

| PersonID | LastName | FirstName |	Age |
|-|-|-|-|
| 1 | Hansen | Ola | 30 |
| 2 | Svendson | Tove | 23 |
| 3	| Pettersen | Kari | 20 |

Orders table:

| OrderID | OrderNumber | PersonID |
|-|-|-|
| 1 | 77895 | 3 |
| 2 | 44678 | 3 |
| 3	| 22456 | 2 |
| 4	| 24562 | 1 |

## Inlab 5

Student Details:
| ID | Name | Course |
|-|-|-|
| 1041 | Sara | Java |
| 1204 | Aryan | C++ |
| 1043 | Sameer | Python |
| 1032 | Abhijeet | Oracle |

Students Markes:
| ID | Marks |
|-|-|
| 1041 | 65 |
| 1204 | 55 |
| 1043 | 73 |
| 1032 | 62 |


## Inlab 6

### Question 1

Give the SQL queries for creation of these tables:

PRODUCTS Table:
| pro_id | pro_name | Pro_Price | Supplier_id |
|-|-|-|-|
| 1 | Mouse | 100 | 2 |
| 2 | Keyboard | 150 | 1 |
| 3 | HHD | 1000 | 4 |
| 4 | Mouse | 200 | 1 |
| 5 | Keyboard | 100 | 2 |
| 6 | Mouse | 150 | 3 |

SUPPLIER Table:
| Supplier_id | Supplier_name |
|-|-|
| 1 | DELL |
| 2 | Lenovo |
| 3 | HP |
| 4 | Amazon |

Apply the following Joins using SQL
a. Inner Join
b. Equi Join
c. Natural Join
d. Cross Join (Cartesian product)
e. Outer Join ( Left , Right and Full Outer Join)


### Question 2

Tutorial Table:
| id | title | subject | duration | upload_date |
|-|-|-|-|-|
| 1 | Select Query | SQL | 4.56 | 2013-08-08 |
| 2 | Insert Query | SQL | 5.32 | 2013-08-08 |
| 3 | Arithmetic Operators | SQL | 6.37 | 2013-08-08 |
| 4 | Logical Operators | SQL | 5.11 | 2013-08-08 |
| 5 | Order By Clause | SQL | 4.19 | 2013-08-08 |
| 6 | Functions | C | 5.23 |  2013-04-04 |


Tutorial_Info Table:
| tutorial_id | views | likes | dislikes | shares |
|-|-|-|-|-|
| 1 | 15000 | 54 | 13 | 6 |
| 2 | 12500 | 43 | 21 | 2 |
| 3 | 17500 | 31 | 29 | 12 |
| 4 | 16000 | 17 | 0 | 11 |
| 5 | 85000 | 117 | 10 | 19 |
| 6 | 112000 | 191 | 46 | 34 |

a. Display tutorial_id, title, duration, views, likes and shares of each  tutorials
b. Display the title of tutorial disliked by more than 20 members
c. Display the longest tutorial title with its number of views
d. Display the title of the last uploaded tutorial with its number of shares.
f. For each subject sum up its duration along with its count
g. Display the title of the tutorial by adding its likes, views, shares and subtract with dislikes.


### Question 3

Create the following table, where manager is also an employee, stored in the same table:

Columns:
- id (PRIMARY KEY)
- emp_name
- manager_id

Also enter some sample data.

Apply the Self Join to list the employee name along with his manager name whereas manager is also an employee of the same table

---

## Inlab 7

Create the below Relational Database Table and then insert records

### EMP Table

| EMPNO | ENAME | HIREDATE | MGR | SAL | DEPTNO |
| 7369 | SMITH | 17-DEC-80 | 7902 | 800 | 20 |
| 7499 | ALLEN | 20-FEB-81 | 7698 | 1600 | 30 |
| 7521 | WARD | 22-FEB-81 | 7698 | 1250 | 30 |
| 7566 | JONES | 02-APR-81 | 7839 | 2975 | 20 |
| 7654 | MARTIN | 28-SEP-81 | 7698 | 1250 | 30 |
| 7698 | BLAKE | 01-MAY-81 | 7839 | 2850 | 30 |
| 7782 | CLARK | 09-JUN-81 | 7839 | 2450 | 10 |
| 7788 | SCOTT | 19-APR-87 | 7566 | 3000 | 20 |
| 7839 | KING | 17-NOV-81 | | 5000 | 10 |
| 7844 | TURNER | 08-SEP-81 | 7698 | 1500 | 30 |
| 7876 | ADAMS | 23-MAY-87 | 7788 | 1100 | 20 |
| 7900 | JAMES | 03-DEC-81 | 7698 | 950 | 30 |
| 7902 | FORD | 03-DEC-81 | 7566 | 3000 | 20 |
| 7934 | MILLER | 23-JAN-82 | 7782 | 1300 | 10 |

### DEPT table

| DEPTNO | DNAME | LOC |
| 10 | ACCOUNTING | NEW YORK |
| 20 | RESEARCH | DALLAS |
| 30 | SALES | CHICAGO |
| 40 | OPERATIONS | BOSTON |


### Execute the Query for the following questions
1. Find all employees whose departments are located at the location CHICAGO.
2. Select the name of the employees getting highest salary
3. List out the List of employees name with ID who are getting above average salary of employees
4. List out the name of the Employees who are getting the same salary as "FORD" Salary.
5. List out the deptname of the employee who is getting maximum salary
6. Find out the name of employee getting second maximum salary
7. List out the name of the employee working in the Location "BOSTON" or "DALLAS"
8. List out the Name of the employee who are not working in the Location 'NEW YORK'
9. Finds all employees whose salaries are greater than the lowest salary of every department.
10. Finds all employees whose salaries are greater than or equal to the highest salary of every department
11. Calculate the average of average salary of departments (using subquery in 'from' clause)
12. Finds the salaries of all employees, their average salary, and the difference between the salary of 
each employee and the average salary using subquery in 'Select' Clause
13. Update 10% increase in salary of employee working in the deptname 'Sales'
14. Delete the employee whose experience is greater than 30 years using subquery


### Correlated Sub Query:
15. List out the department name where there are employees getting minimum salary as Rs1000.
16. Finds all departments that do not have any employee with the salary greater than 10,000
17. List out the Employee whose manager name is 'JONES'.
18. List out the name of every manager.
19. finds all departments which have at least one employee with the salary is greater than 10,000:
20. Select employees whose salary is greater than the average salary of all departments.

---


## Inlab 8

a. Find the names of all red parts
b. Find all prices for parts that are red or green. (A part may have different prices from different manufacturers.)
c. Find the SupplierIDs of all suppliers who supply a part that is red or green
d. Find the names of all suppliers who supply a part that is red or green.

Use Correlated Sub-Query for the Following

e. For every Parts supplied by the suppliers, List out the price
f. For Every parts, List out the Supplier Name and Address.
g. Update the Price of the one pID with Other part PID
h. Delete the Red coloured parts from the catalog 
i. Create a copy of PARTS table using Insert with Subquery
j. For every Part ,list out its price along with deviation of price with average price of all parts


# Lab Cycle Sheet

# cycle sheet 1

QUESTION
The Publisher and their published article’s information about the Journal Data is given as below
Publisher Table:
| ColumnName | Type | Size | Constraint | Default |
|-|-|-|-|-|
| Pub_ID | Number | 4 | Primary Key | Auto Inc |
| Pub_Name | Varchar2 | 25 | - | 'Unknown' |
| City | Varchar2 | 15 | - | Chennai |
| State | Varchar2 | 10 | - | - |
| Country | Varchar2 | 25 | - | India | 
| URL | Varchar2 | 25 | Unique | - |

Journal Table:
| ColumnName | Type | Size | Constraint | Default |
|-|-|-|-|-|
| Paper_ID | Number | 5 | Primary Key | Auto Inc |
| Paper_Title | Varchar2 | 25 | - | - |
| Pub_ID | Number | 4 | Foreign Key | - |
| Pub_Date | Date | - | - | - |
| Pub_Cost | Number | (12, 2) | - |
| Process_Cost | Number | (12, 2) | - | 0 |
| Royalty | Number | (3, 2) | - | 12% = 0.12  |

1. Create tables identifying the primary keys and foreign keys, Insert necessary tuples into the tables. (Min 5 rows) Use Interactive way of inserting record.
2. Enforce the Constraints
a). The Publication Cost should be always greater than 1000 and less than 9999.
b). Create a constraint with name pname so that it will check the publisher name should not be ‘XYZ’.
c). Create a constraint with name prname so that it will check the paper title should not be ‘PQR’ and the processing cost should not be a negative value.
d) Alter the table to add the mobile number of publisher table and its length should be 10.
e)Check the value of royalty to the author and it should not be a negative ranges between 0 to 1
h) Enforce foreign key constraints as per the tables given with 'ON CASECADE’ feature.
i) Rename the column named as ‘Process_cost ’ into ‘ProcessingCost’
j) add a column ‘GST_COST’ into Journal table such that it store the percentage of GST tax (0.15 for 15%). The default % of GST is 8%.

3. Write SQL
a) . List the publishers whose name starts with ‘IEEE’
b). List the publishers from city ‘Chennai’.
c). List the Foreign publisher and their URL
d).Test the string manipulation functions – UPPER, LOWER, INITCAP, LENGTH, LPAD, RPAD, LTRIM, RTRIM and TRIM and NVL using select queries on data present in the tables. Use one query each for demonstration of one function.
e) Sort the List of publisher alphabetically
f) List out the publisher name from India and their city is ‘Mumbai’
g) List the papers with its title published on or before today.
h) Calculate the GST amount based on the GST % for all Total cost(processing Cost+Publication Cost).
i) Delete the publisher with name ‘RI Publisher’j) Check the referential integrity during insertion / updation / Deletion of records of the table.
k) Update the publisher’s Country column by new value by replacing the old value
L) Count and Display the number of publishers.
M) count the no of publishers from USA
N) Count the No of Publisher from each country in descending order of the count
P) List out the count of customers in each country whereas the country should have at least 2 publishers
Q) List out the sum , avg, min max of all processingCost of the papers
R). Find out the Total Amount of all papers for each year.
S).Find out the average of publication cost of papers from each publisher.
T).Apply the multiple functions into a group by clause using any one of the table
U). Apply the Nesting Aggregate Functions
V) List out the publisher id who have published the papers for more than one 5 times
W) Display the paper-id sorted based on its amount
X) Find out the months difference between sysdate and pubdate of every paper
Y) Display the Pub_date of each paper in terms of its sentences
Z) Display the pub date with YYYY-MM-DD HH24:MI:SS format

# cycle sheet 2

Consider the Following Relations
- Person ( name, age, gender ): name is a key
- Frequents ( name, pizzeria ): (name, pizzeria) is a key
- Eats ( name, pizza ): (name, pizza) is a key
- Serves ( pizzeria, pizza, price ): (pizzeria, pizza) is a key

1. Simple Joins:
- Apply Cross Join, Inner Join, Outer Join to any two of the relevant tables above
- Apply SET Operations such as Union, Intersection, Minus and Division Operations in relevant tables.
- Write SQL using Join for solving the following Questions
    a. Find all pizzerias frequented by at least one person under the age of 18.
    b. Find the names of all females who eat either mushroom or pepperoni pizza (or both).
    c. Find the names of all females who eat both mushroom and pepperoni pizza.
    d. Find all pizzerias that serve at least one pizza that Amy eats for less than $10.00.
    e. Find all pizzerias that are frequented by only females or only males.
    f. For each person, find all pizzas the person eats that are not served by any pizzeria the person frequents. Return all such person (name) / pizza pairs.
    g. Find the names of all people who frequent only pizzerias serving at least one pizza they eat.
    h. Find the names of all people who frequent every pizzeria serving at least one pizza they eat.
    i. Find the pizzeria serving the cheapest pepperoni pizza. In the case of ties, return all of the cheapest-pepperoni pizzerias.


2. Give 5 Non Correlated and 5 Correlated Sub-Query for the above Relational tables.

- (Non-Correlated Subqueries)
  - Q2A (All persons who have not frequented any pizzeria)
  - Q2B (Pizzas that have never been eaten by anyone)
  - Q2C (Average price of all pizzas served)
  - Q2D (Pizzerias that serve all types of pizzas)
  - Q2E (People who have frequented Pizzeria A)
- (Correlated Subqueries)
  - Q2F (Persons who have at least one pizzeria that serves what they like)
  - Q2G (Pizzerias which are only frequented by people younger than 30)
  - Q2H (Count of persons who have eaten a 'pepperoni' pizza at any of the pizzerias)
  - Q2I (Names of persons who frequent pizzerias that serve more pizzas than the person eats)
  - Q2J (People who are less than average age of their gender)