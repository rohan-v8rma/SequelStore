-- A1. Display small number and large number of two numbers
DECLARE
   num1 NUMBER := 10;
   num2 NUMBER := 20;
BEGIN
   IF num1 > num2 THEN
      dbms_output.put_line('Larger number is ' || num1);
      dbms_output.put_line('Smaller number is ' || num2);
   ELSE
      dbms_output.put_line('Larger number is ' || num2);
      dbms_output.put_line('Smaller number is ' || num1);
   END IF;
END;
/

-- A2. Calculate simple interest given the principle, rate of interest, and time.
DECLARE
   p NUMBER := 1000;
   r NUMBER := 5;
   t NUMBER := 2;
   si NUMBER;
BEGIN
   si := (p * r * t) / 100;
   dbms_output.put_line('Simple interest is ' || si);
END;
/

-- A3. Check if a given number is odd or even
DECLARE
   num NUMBER := 10;
BEGIN
   IF MOD(num, 2) = 0 THEN
      dbms_output.put_line(num || ' is even');
   ELSE
      dbms_output.put_line(num || ' is odd');
   END IF;
END;
/

-- A4. Check whether a date falls on Sunday
DECLARE
   input_date DATE := TO_DATE('2023-06-25', 'YYYY-MM-DD');
BEGIN
   IF TO_CHAR(input_date, 'DY') = 'SUN' THEN
      dbms_output.put_line('The date is a Sunday');
   ELSE
      dbms_output.put_line('The date is not a Sunday');
   END IF;
END;
/

-- A5. Convert a temperature in scale Fahrenheit to Celsius and vice versa
DECLARE
   temp_f NUMBER := 100;
   temp_c NUMBER := 38;
BEGIN
   dbms_output.put_line(temp_f || ' F is ' || TRUNC((temp_f - 32) * 5 / 9, 2) || ' C');
   dbms_output.put_line(temp_c || ' C is ' || TRUNC((temp_c * 9 / 5) + 32, 2) || ' F');
END;
/

-- B1. Display small number and large number of two numbers using a procedure
CREATE OR REPLACE PROCEDURE find_min_max(num1 IN NUMBER, num2 IN NUMBER) IS
BEGIN
   IF num1 > num2 THEN
      dbms_output.put_line('Larger number is ' || num1);
      dbms_output.put_line('Smaller number is ' || num2);
   ELSE
      dbms_output.put_line('Larger number is ' || num2);
      dbms_output.put_line('Smaller number is ' || num1);
   END IF;
END;
/

BEGIN
   find_min_max(10, 20);
END;
/

-- B2. Find simple interest using a function
CREATE OR REPLACE FUNCTION calc_si(p IN NUMBER, r IN NUMBER, t IN NUMBER) RETURN NUMBER IS
   si NUMBER;
BEGIN
   si := (p * r * t) / 100;
   RETURN si;
END;
/

DECLARE
   interest NUMBER;
BEGIN
   interest := calc_si(1000, 5, 2);
   dbms_output.put_line('Simple interest is ' || interest);
END;
/

-- B3. Check if a given number is odd or even using a function
CREATE OR REPLACE FUNCTION is_even(num IN NUMBER) RETURN VARCHAR2 IS
BEGIN
   IF MOD(num, 2) = 0 THEN
      RETURN 'Even';
   ELSE
      RETURN 'Odd';
   END IF;
END;
/

DECLARE
   num_type VARCHAR2(10);
BEGIN
   num_type := is_even(10);
   dbms_output.put_line('The number is ' || num_type);
END;
/

-- B4. Check whether a date falls on Sunday using a function
CREATE OR REPLACE FUNCTION is_sunday(input_date IN DATE) RETURN VARCHAR2 IS
BEGIN
   IF TO_CHAR(input_date, 'DY') = 'SUN' THEN
      RETURN 'Yes';
   ELSE
      RETURN 'No';
   END IF;
END;
/

DECLARE
   result VARCHAR2(10);
BEGIN
   result := is_sunday(TO_DATE('2023-06-25', 'YYYY-MM-DD'));
   dbms_output.put_line('Is the date a Sunday? ' || result);
END;
/

-- B5. Convert a temperature in scale Fahrenheit to Celsius and vice versa using a function
CREATE OR REPLACE FUNCTION f_to_c(temp_f IN NUMBER) RETURN NUMBER IS
BEGIN
   RETURN TRUNC((temp_f - 32) * 5 / 9, 2);
END;
/

CREATE OR REPLACE FUNCTION c_to_f(temp_c IN NUMBER) RETURN NUMBER IS
BEGIN
   RETURN TRUNC((temp_c * 9 / 5) + 32, 2);
END;
/

DECLARE
   temp_c NUMBER;
   temp_f NUMBER;
BEGIN
   temp_c := f_to_c(100);
   temp_f := c_to_f(38);
   dbms_output.put_line('100 F is ' || temp_c || ' C');
   dbms_output.put_line('38 C is ' || temp_f || ' F');
END;
/