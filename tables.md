# Inlab 2 and 3A

| ID | ENAME  | DOJ |  SALARY | BONUS | DEPT | DESIGNATION | MANAGER | COMPID |
|-|-|-|-|-|-|-|-|-|
| 1 | James Potter | 01-Jun-14 | 75000 | 1000 | ICP | PM | NULL | 1001 |
| 2 | Ethan McCarty | 01-Feb-14 | 90000 | 1200 | ETA | PM | NULL | NULL |
| 3 | Emily Rayner | 01-Jan-14 | 25000 | 100 | ETA | SE | 2 | 1002 |
| 4 | Jack Abraham | 01-Jul-14 | 30000 | NULL | ETA | SSE | 2 | NULL |
| 5 | Ayaz Mohammad | 01-Apr-14 | 40000 | NULL | ICP | TA | 1 | 1003 |

# Inlab 3B

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

# Inlab 4A

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

# Inlab 4B

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