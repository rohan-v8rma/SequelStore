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
