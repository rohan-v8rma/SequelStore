# INDEX

- [INDEX](#index)
- [Syntax for foreign key](#syntax-for-foreign-key)
- [Composite foreign keys](#composite-foreign-keys)
- [`HAVING and `GROUP BY\`](#having-and-group-by)
- [Correlated Sub-query Examples](#correlated-sub-query-examples)
  - [Example 1](#example-1)
  - [Example 2](#example-2)
  - [Example 3](#example-3)


# Syntax for foreign key

CREATE TABLE FREQUENTS (
  NAME VARCHAR2(30) PRIMARY KEY,
  FOREIGN KEY(NAME) REFERENCES PERSON(NAME),
)

# Composite foreign keys

If a table has a composite primary key, example: (name, age),
name and age have to be referenced as foreign key together, not separately.

# `HAVING and `GROUP BY`

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