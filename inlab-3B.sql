DROP TABLE Quotation;

CREATE TABLE Quotation (
  QuotationId VARCHAR(10),
  SupplierId VARCHAR(10),
  ItemCode VARCHAR(10),
  QuotedPrice NUMBER
);

INSERT INTO Quotation VALUES ('Q1001', 'S1001', 'I1012', 1500);
INSERT INTO Quotation VALUES ('Q1002', 'S1002', 'I1012', 1400);
INSERT INTO Quotation VALUES ('Q1003', 'S1003', 'I1013', 1450);
INSERT INTO Quotation VALUES ('Q1004', 'S1004', 'I1012', 600);
INSERT INTO Quotation VALUES ('Q1005', 'S1005', 'I1013', 625);


--Q1
SELECT ItemCode, COUNT(*) AS NumberOfQuotations
FROM Quotation
GROUP BY ItemCode;

--Q2
SELECT ItemCode, SUM(QuotedPrice) AS TotalQuotationPrice
FROM Quotation
GROUP BY ItemCode;
--Q3
SELECT ItemCode, MIN(QuotedPrice) AS MinimumQuotedPrice
FROM Quotation
GROUP BY ItemCode;
--Q4
SELECT SupplierId, COUNT(*) AS NumberOfQuotations
FROM Quotation
GROUP BY SupplierId;
--Q5
SELECT SupplierId, MAX(QuotedPrice) AS MaximumQuotedPrice
FROM Quotation
GROUP BY SupplierId;
--Q6
SELECT SupplierId, ItemCode, COUNT(*) AS NumberOfQuotations
FROM Quotation
GROUP BY SupplierId, ItemCode;
