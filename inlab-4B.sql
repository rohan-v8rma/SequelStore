DROP TABLE Orders;
DROP TABLE Persons;

CREATE TABLE Persons (
  PersonID int NOT NULL,
  LastName varchar(50) NOT NULL,
  FirstName varchar(50),
  Age int
);

ALTER TABLE Persons
    ADD CONSTRAINT
    PK_PersonID PRIMARY KEY(PersonID);
    

-- Insert data into the Persons table
INSERT INTO Persons VALUES (1, 'Hansen', 'Ola', 30);
INSERT INTO Persons VALUES (2, 'Svendson', 'Tove', 23);
INSERT INTO Persons VALUES (3, 'Pettersen', 'Kari', 20);


CREATE TABLE Orders (
  OrderID int NOT NULL,
  OrderNumber int NOT NULL,
  PersonID int,
  PRIMARY KEY (OrderID)
);

ALTER TABLE Orders
  ADD CONSTRAINT FK_PersonOrder
  FOREIGN KEY(PersonID) REFERENCES Persons(PersonID);

-- Inserting a row that doesn't violate FK constraint.
INSERT INTO Orders (OrderID, OrderNumber, PersonID)
  VALUES (1, 77895, 3);

-- Trying to insert a row that violates the foreign key constraint,
-- In order to test referential integrity.
INSERT INTO Orders (OrderID, OrderNumber, PersonID)
  VALUES (2, 44678, 4);


-- Insert data into the Orders table
INSERT INTO Orders VALUES (2, 44678, 3);
INSERT INTO Orders VALUES (3, 22456, 2);
INSERT INTO Orders VALUES (4, 24562, 1);


-- Modify the foreign key constraint to have ON DELETE CASCADE action
ALTER TABLE Orders DROP CONSTRAINT FK_PersonOrder;

ALTER TABLE Orders ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID) ON DELETE CASCADE;

SELECT * FROM ORDERS;

-- -- Delete a person record
DELETE FROM Persons WHERE PersonID = 3;
-- The associated orders for PersonID 3
-- will be automatically deleted due to ON DELETE CASCADE action
SELECT * FROM ORDERS;

INSERT INTO Persons VALUES (3, 'Pettersen', 'Kari', 20);

-- Insert data into the Orders table
INSERT INTO Orders VALUES (1, 77895, 3);
INSERT INTO Orders VALUES (2, 44678, 3);
INSERT INTO Orders VALUES (3, 22456, 2);
INSERT INTO Orders VALUES (4, 24562, 1);

-- Modify the foreign key constraint to have ON DELETE SET NULL action
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
ON DELETE SET NULL;

SELECT * FROM Orders;
-- Delete a person record
DELETE FROM Persons WHERE PersonID = 3;
-- The associated orders for PersonID 3 will automatically have FK set to NULL
SELECT * FROM Orders;