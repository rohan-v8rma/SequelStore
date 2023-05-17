DROP TABLE SALES_PERSON;
DROP TABLE SALES;

--Q1

CREATE TABLE SALES (
    SALE_ID INT NOT NULL,
    SALE_AMOUNT INT NOT NULL,
	VENDOR_NAME VARCHAR(50) NOT NULL,
  	SALE_DATE DATE,
  	PROFIT INT
);


--Q2
ALTER TABLE SALES ADD CONSTRAINT UC_SaleId UNIQUE(SALE_ID);

--Q3
ALTER TABLE SALES ADD CONSTRAINT CHK_VendorName CHECK (VENDOR_NAME <> 'ABC');

--Q4
ALTER TABLE Sales MODIFY (VENDOR_NAME DEFAULT 'VIT, Vellore');

--Q5
-- Step 1: Drop the existing primary key constraint
ALTER TABLE Sales DROP CONSTRAINT UC_SaleId;

-- Step 2: Recreate the primary key constraint with the desired modification
ALTER TABLE Sales ADD CONSTRAINT PK_SaleId PRIMARY KEY (SALE_ID);


--Q6
ALTER TABLE SALES ADD CONSTRAINT cusalesidamt UNIQUE (SALE_ID, SALE_AMOUNT);

--Q7
ALTER TABLE Sales ADD CONSTRAINT ccheckprof CHECK (VENDOR_NAME <> 'ABC' OR (VENDOR_NAME = 'ABC' AND PROFIT > 500));

--Q8

-- Dropping unique constraint since primary key constraint already has a unique constraint.
-- If we don't do so, ORA-02261: such unique or primary key already exists in the table
ALTER TABLE SALES DROP CONSTRAINT cusalesidamt;

-- Dropping other primary key constraint because each table can have only 1 primary key.
ALTER TABLE Sales DROP CONSTRAINT PK_SaleId;

-- Adding the new primary key constraint 
ALTER TABLE SALES ADD CONSTRAINT PK_SaleIdAmt PRIMARY KEY (SALE_ID, SALE_AMOUNT);


--Q9
ALTER TABLE Sales ADD CONSTRAINT CHK_Sample CHECK (SALE_AMOUNT > 1);
-- Constraint disabled
ALTER TABLE Sales DISABLE CONSTRAINT CHK_Sample;

-- Inserting a record that violates the constaint (sale amount is 0 here)
INSERT INTO Sales VALUES (23, 0, 'ADC', TO_DATE('01-12-2018', 'DD-MM-YYYY'), 20);

-- Enable not permitted since one record doesn't satisfy the constraint.
ALTER TABLE Sales ENABLE CONSTRAINT CHK_Sample;



CREATE TABLE Sales_Person (
  SALES_PERSON_ID INT,
  SALE_PERSON_NAME VARCHAR(50),
  SALES_PERSON_LOCATION VARCHAR(50),
  SALE_ID INT
);

-- Removing the multi-column PK constraint, to add SALE_ID PK constraint
ALTER TABLE SALES DROP CONSTRAINT PK_SaleIdAmt;
-- Adding SALE_ID PK constraint, in order to reference it as foreign key
ALTER TABLE SALES ADD CONSTRAINT PK_SaleId PRIMARY KEY (SALE_ID);


-- --Q10
ALTER TABLE SALES_PERSON 
	ADD CONSTRAINT 
    FK_SaleId FOREIGN KEY (SALE_ID) REFERENCES Sales(SALE_ID);

--Q11
ALTER TABLE SALES 
MODIFY PROFIT INT NOT NULL;
-- Modify is used to modify columns.

--Q12
ALTER TABLE Sales 
MODIFY VENDOR_NAME DEFAULT 'VIT,Chennai';


