Syntax for foreign key:
CREATE TABLE FREQUENTS (
  NAME VARCHAR2(30) PRIMARY KEY,
  FOREIGN KEY(NAME) REFERENCES PERSON(NAME),
)

Composite foreign keys:
If a table has a composite primary key, example: (name, age),
name and age have to be referenced as foreign key together, not separately.

GROUP BY is always needed whenever we need to use the HAVING clause.

HAVING clause is for directly using aggregate functions in condition: HAVING COUNT(*) > 1
Where clause is used when we want to use aggregate functions in an indirect way: WHERE price = (select min(price) from items)