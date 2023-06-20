-- Drop the existing tables
DROP TABLE Serves;
DROP TABLE Frequents;
DROP TABLE Eats;
DROP TABLE Person;

-- Create the Person table
CREATE TABLE Person (
  name VARCHAR(30) PRIMARY KEY,
  age INT,
  gender VARCHAR(10) CHECK(gender in ('male', 'female'))
);

-- Person table records
INSERT INTO Person VALUES ('John', 15, 'male');
INSERT INTO Person VALUES ('Emma', 30, 'female');
INSERT INTO Person VALUES ('Michael', 40, 'male');
INSERT INTO Person VALUES ('Amy', 28, 'female');
INSERT INTO Person VALUES ('David', 35, 'male');


-- Create the Frequents table
CREATE TABLE Frequents (
  name VARCHAR(30),
  pizzeria VARCHAR(30),
  PRIMARY KEY (name, pizzeria),
  FOREIGN KEY (name) REFERENCES Person(name)
);

-- Frequents table records
INSERT INTO Frequents VALUES ('John', 'Pizzeria A');
INSERT INTO Frequents VALUES ('Emma', 'Pizzeria B');
INSERT INTO Frequents VALUES ('Amy', 'Pizzeria C');
INSERT INTO Frequents VALUES ('David', 'Pizzeria B');
INSERT INTO Frequents VALUES ('David', 'Pizzeria A');

-- Create the Eats table
CREATE TABLE Eats (
  name VARCHAR(30),
  pizza VARCHAR(30),
  PRIMARY KEY (name, pizza),
  FOREIGN KEY (name) REFERENCES Person(name)
);

-- Eats table records
INSERT INTO Eats VALUES ('John', 'mushroom');
INSERT INTO Eats VALUES ('Emma', 'pepperoni');
INSERT INTO Eats VALUES ('Michael', 'hawaiian');
INSERT INTO Eats VALUES ('Amy', 'cheese');
INSERT INTO Eats VALUES ('Amy', 'hawaiian');
INSERT INTO Eats VALUES ('David', 'supreme');
-- INSERT INTO Eats VALUES ('Emma', 'mushroom'); -- Useful for testing whether 1C is working

-- Create the Serves table
CREATE TABLE Serves (
  pizzeria VARCHAR(30),
  pizza VARCHAR(30),
  price INT,
  PRIMARY KEY (pizzeria, pizza)
);

-- Serves table records
INSERT INTO Serves VALUES ('Pizzeria A', 'mushroom', 10);
INSERT INTO Serves VALUES ('Pizzeria A', 'pepperoni', 12);
INSERT INTO Serves VALUES ('Pizzeria B', 'hawaiian', 11);
INSERT INTO Serves VALUES ('Pizzeria B', 'supreme', 13);
INSERT INTO Serves VALUES ('Pizzeria C', 'cheese', 9);

-- Cross Join (Tells us all combinations of pizzerias and pizzas)
SELECT Serves_1.pizzeria, Serves_2.pizza
FROM Serves Serves_1
CROSS JOIN
Serves Serves_2;

-- Inner Join (Tells us the pizzas preferred by different genders)
SELECT DISTINCT Person.gender, Eats.pizza
FROM Person
INNER JOIN Eats
ON Person.name = Eats.name
ORDER BY GENDER;

-- Outer Join (Tells us all possible prices and who pays them. It also tells which price isn't paid by anyone)
SELECT Serves.price, Frequents.name
FROM Serves
LEFT OUTER JOIN Frequents
ON Serves.pizzeria = Frequents.pizzeria
ORDER BY Price;

-- Union Operator (removes duplicates automatically from combined data) (Names of people who either eat pizza OR go to a pizzeria)
SELECT Name
FROM Frequents
UNION (SELECT Name from Eats);

-- Intersection operator (People who eat pizza AND go to pizzeria)
SELECT DISTINCT Name from Eats
INTERSECT
SELECT DISTINCT Name from Frequents;


-- Minus operator (People who eat pizza but don't go to any pizzeria)
SELECT DISTINCT Name from Eats
MINUS
SELECT DISTINCT Name from Frequents;

-- Division operator (Which elements in 1 set are related to all other elements in another set. Figure out which people go to all pizzerias)
SELECT P.Name
From Frequents P
HAVING COUNT(P.Name) = (
    SELECT COUNT(DISTINCT Pizzeria) 
    FROM Frequents
)
GROUP BY P.Name;


-- Q1A
SELECT DISTINCT Pizzeria 
FROM Frequents
INNER JOIN 
(SELECT Name FROM Person WHERE age < 18) under18
ON Frequents.Name = under18.name;

-- Q1B (women that eat mushroom or pepperoni pizza)
SELECT DISTINCT E.Name
FROM Eats E
INNER JOIN (
    SELECT Name 
    FROM Person 
    WHERE gender = 'female'
) women
ON E.Name = women.Name
WHERE pizza = 'mushroom'
OR pizza = 'pepperoni';

-- Q1C
SELECT E1.Name
FROM Eats E1
INNER JOIN (
    SELECT E.Name
    FROM Eats E
    INNER JOIN (
    	SELECT Name
    	FROM Person
    	WHERE gender = 'female'	
    ) women
    ON E.Name = women.name
    WHERE E.pizza = 'pepperoni'
) E2
ON E1.Name = E2.Name
WHERE E1.pizza = 'mushroom';

-- Q1D
SELECT Serves.Pizzeria
FROM Serves
INNER JOIN (
    -- pizzerias amy eats
    SELECT Pizza 
    FROM Eats
    WHERE Name='Amy'
) pizzas_amy_eats
-- Pizzerias that serve pizzas that amy eats.
ON Serves.Pizza = pizzas_amy_eats.Pizza
INNER JOIN (
    Select Pizzeria 
    FROM Frequents 
    WHERE Name = 'Amy'
) pizzerias_amy_frequents
-- Pizzerias that amy frequents, which also serve what she eats.
ON Serves.pizzeria = pizzerias_amy_frequents.pizzeria  
-- Price of pizza less than 10
WHERE Serves.price < 10;

-- Q1E (We find the the intersection of pizzerias frequented by males, and pizzerias frequented by females. Then we select the pizzerias not in this intersection)
SELECT DISTINCT Pizzeria 
From Frequents
MINUS
-- getting the pizzerias not frequented by BOTH men and women.
(
-- pizzerias frequented by men
SELECT Frequents.Pizzeria
FROM Frequents
INNER JOIN (
    -- names of men
    SELECT Name 
    FROM Person 
    WHERE Gender='male'
) men
ON Frequents.name = men.name

INTERSECT

-- pizzerias frequented by women
SELECT Frequents.Pizzeria
FROM Frequents
INNER JOIN (
    -- names of women
    SELECT Name 
    FROM Person 
    WHERE Gender='female'
) women
ON Frequents.name = women.name  
);

-- Q1F (Pizzas a person eats NOT served by any pizzeria they frequent. For people who don't frequent any pizzeria, all pizzas they eat shown)
SELECT E.Name, E.Pizza
FROM Eats E
-- Since the inner subquery gets us pizzas served by places E.name frequents, NOT IN allows us to get pizzas not served by any place they frequent.
WHERE E.Pizza NOT IN (
    -- This subquery gets us the pizzas served by the places E.Name frequents
    SELECT Pizza
    FROM Serves
    INNER JOIN
    (SELECT Pizzeria FROM Frequents WHERE Name = E.Name) pizzerias_current_person_frequents
    ON Serves.pizzeria = pizzerias_current_person_frequents.pizzeria
);

-- Q1G 
-- This gets us the names of the people who only frequent pizzerias that serve that atleast 1 pizza they eat. 
-- Resultingly, we get names of people who don't frequent any pizzerias, as well because there is no risk of not getting what they eat)
SELECT P.Name
FROM Person P
WHERE
    -- Count of pizzerias visited by P
    (SELECT COUNT(Pizzeria)
    FROM Frequents 
    WHERE NAME = P.Name)
	=
    -- Count of pizzerias visited by P, that also serve that they eat.
    (Select COUNT(Serves.pizzeria)
    FROM Serves
    INNER JOIN ( 
        SELECT *
        FROM Frequents
        WHERE NAME = P.Name 
    ) pizzerias_p_frequents
    ON pizzerias_p_frequents.pizzeria = Serves.pizzeria
    INNER JOIN Eats
    ON Eats.pizza = Serves.pizza);

-- This is not valid, since we only get people that frequent at least 1 pizzeria. We need to see all people.
-- SELECT P.Name
-- FROM Frequents P
-- HAVING COUNT(P.Name) =
--     -- Count of pizzerias visited by P, that also serve that they eat.
--     (Select COUNT(Serves.pizzeria)
--     FROM Serves
--     INNER JOIN ( 
--         SELECT *
--         FROM Frequents
--         WHERE NAME = P.Name 
--     ) pizzerias_p_frequents
--     ON pizzerias_p_frequents.pizzeria = Serves.pizzeria
--     INNER JOIN Eats
--     ON Eats.pizza = Serves.pizza)
-- GROUP BY P.Name;

-- Q1H

-- This gets us the names of people that DO frequent pizzerias that DON'T serve anything they eat.
-- Seeing DAVID and EMMA as the results
	-- DAVID only eats supreme but still goes to Pizzeria A which does NOT serve supreme
	-- EMMA only eats pepperoni but still goes to Pizzeria B which does NOT serve pepperoni
SELECT DISTINCT F.Name
From Frequents F
-- F frequents a pizzeria that does NOT serve anything they eat.
WHERE F.Pizzeria NOT IN (
    -- pizzerias that serve what F eats.
   SELECT DISTINCT Pizzeria
   FROM Serves
   INNER JOIN (
    -- Getting the pizzas F eats
    SELECT Pizza 
    FROM Eats 
    WHERE Name = F.Name
   ) pizzas_F_eats
   ON Serves.pizza = pizzas_F_eats.pizza
);

-- This gets us the names of the people that DO NOT frequent any pizzerias that DON'T serve anything they eat.
SELECT Name 
FROM Person
MINUS
-- This gets us the names of people that DO frequent pizzerias that DON'T serve anything they eat.
SELECT DISTINCT F.Name
From Frequents F
-- F frequents a pizzeria that does NOT serve anything they eat.
WHERE F.Pizzeria NOT IN (
    -- pizzerias that serve what F eats.
   SELECT DISTINCT Pizzeria
   FROM Serves
   INNER JOIN (
    -- Getting the pizzas F eats
    SELECT Pizza 
    FROM Eats 
    WHERE Name = F.Name
   ) pizzas_F_eats
   ON Serves.pizza = pizzas_F_eats.pizza
);

-- Q1I All pizzerias that serve pepperoni at the lowest cost.

-- Done using subquery
SELECT Pizzeria
FROM Serves
WHERE Pizza = 'pepperoni'
AND PRICE =  (
    SELECT MIN(price)
    FROM Serves
    WHERE Pizza = 'pepperoni'
);

-- Done using join
SELECT S1.Pizzeria
FROM Serves S1
INNER JOIN (
    SELECT MIN(price) as min_cost_of_pepperoni_pizza
    FROM Serves
    WHERE PIZZA = 'pepperoni'
) S2
ON S1.price = S2.min_cost_of_pepperoni_pizza
WHERE Pizza = 'pepperoni';




-- Q2 (Non-Correlated Subqueries)

-- Q2A (All persons who have not frequented any pizzeria)

SELECT name
FROM Person
WHERE name NOT IN (SELECT name FROM Frequents);


-- Q2B (Pizzas that have never been eaten by anyone)

SELECT pizza
FROM Serves
WHERE pizza NOT IN (SELECT pizza FROM Eats);


-- Q2C (Average price of all pizzas served)

SELECT AVG(price) AS average_price
FROM Serves;


-- Q2D (Pizzerias that serve all types of pizzas)
SELECT pizzeria
FROM Serves
GROUP BY pizzeria
HAVING COUNT(DISTINCT pizza) = (SELECT COUNT(DISTINCT pizza) FROM Serves);


-- Q2E (People who have frequented Pizzeria A)

SELECT Name
From Frequents
WHERE Pizzeria = 'Pizzeria A';


-- Q2 (Correlated Subqueries)

-- Q2F (Persons who have at least one pizzeria that serves what they like)
SELECT f.name
FROM Person f
WHERE EXISTS (
  SELECT pizzeria
  FROM Serves s
  INNER JOIN (
    SELECT pizza
    FROM Eats e
    WHERE e.name = f.name
  ) pizzas_f_eats
  ON pizzas_f_eats.pizza = s.pizza
);


-- Q2G (Pizzerias which are only frequented by people younger than 30)
SELECT DISTINCT pizzeria 
FROM frequents
MINUS
SELECT pizzeria
FROM Frequents f
WHERE (SELECT age FROM Person WHERE name = f.name) > 30;

-- Q2H (Count of persons who have eaten a 'pepperoni' pizza at any of the pizzerias)

SELECT COUNT(*) AS person_count
FROM Frequents f
WHERE EXISTS (
    SELECT name
    FROM (SELECT name, pizza from Eats where pizza = 'pepperoni') e
    INNER JOIN 
    (SELECT pizza from Serves s WHERE s.pizzeria = f.pizzeria) s1
    ON e.pizza = s1.pizza
    WHERE e.name = f.name     
);

-- Q2I (Names of persons who frequent pizzerias that serve more pizzas than the person eats)

SELECT DISTINCT name
FROM Frequents f
WHERE (SELECT COUNT(DISTINCT pizza) FROM Serves s WHERE s.pizzeria = f.pizzeria) 
> (SELECT COUNT(DISTINCT pizza) FROM Eats e WHERE e.name = f.name);

--- Q2J (People who are less than average age of their gender)
SELECT Name
FROM Person p1
WHERE age < (SELECT AVG(age) FROM Person p2 WHERE p2.gender = p1.gender);