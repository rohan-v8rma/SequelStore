-- Simple function (It is necessary that the return value is assigned somewhere)
CREATE OR REPLACE FUNCTION Y
(A IN INT) 
RETURN INT
IS
B INT;
BEGIN
    B:= A;
    DBMS_OUTPUT.PUT_LINE('B is now: ' || B);
    RETURN B;
END;
/

DECLARE
    Z INT;
BEGIN
    Z:=Y(100);
END;
/