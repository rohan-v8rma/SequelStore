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

INSERT INTO Person VALUES ('John', 25, 'male');
INSERT INTO Person VALUES ('Emma', 30, 'female');
INSERT INTO Person VALUES ('Michael', 40, 'male');
INSERT INTO Person VALUES ('Sarah', 28, 'female');
INSERT INTO Person VALUES ('David', 35, 'male');


-- Create the Frequents table
CREATE TABLE Frequents (
  name VARCHAR(30),
  pizzeria VARCHAR(30),
  PRIMARY KEY (name, pizzeria),
  FOREIGN KEY (name) REFERENCES Person(name)
);

INSERT INTO Frequents VALUES ('John', 'Pizzeria A');
INSERT INTO Frequents VALUES ('Emma', 'Pizzeria B');
INSERT INTO Frequents VALUES ('Michael', 'Pizzeria A');
INSERT INTO Frequents VALUES ('Sarah', 'Pizzeria C');
INSERT INTO Frequents VALUES ('David', 'Pizzeria B');
INSERT INTO Frequents VALUES ('David', 'Pizzeria A');

-- Create the Eats table
CREATE TABLE Eats (
  name VARCHAR(30),
  pizza VARCHAR(30),
  PRIMARY KEY (name, pizza),
  FOREIGN KEY (name) REFERENCES Person(name)
);

INSERT INTO Eats VALUES ('John', 'Margherita');
INSERT INTO Eats VALUES ('Emma', 'Pepperoni');
INSERT INTO Eats VALUES ('Michael', 'Hawaiian');
INSERT INTO Eats VALUES ('Sarah', 'Vegetarian');
INSERT INTO Eats VALUES ('Sarah', 'Hawaiian');
INSERT INTO Eats VALUES ('David', 'Supreme');

-- Create the Serves table
CREATE TABLE Serves (
  pizzeria VARCHAR(30),
  pizza VARCHAR(30),
  price INT,
  PRIMARY KEY (pizzeria, pizza),
  FOREIGN KEY 
);

INSERT INTO Serves VALUES ('Pizzeria A', 'Margherita', 10);
INSERT INTO Serves VALUES ('Pizzeria A', 'Pepperoni', 12);
INSERT INTO Serves VALUES ('Pizzeria B', 'Hawaiian', 11);
INSERT INTO Serves VALUES ('Pizzeria B', 'Supreme', 13);
INSERT INTO Serves VALUES ('Pizzeria C', 'Vegetarian', 9);


