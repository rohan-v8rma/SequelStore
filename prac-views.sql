DROP TABLE STUD;

CREATE TABLE STUD (
    ID INT PRIMARY KEY,
    NAME VARCHAR2(20)
);

INSERT INTO STUD VALUES(1, 'ABC');
INSERT INTO STUD VALUES(2, 'ABC');
INSERT INTO STUD VALUES(3, 'DEF');
INSERT INTO STUD VALUES(4, 'GHI');


CREATE OR REPLACE VIEW STUD_VIEW AS
    SELECT * FROM STUD;

SELECT * FROM STUD_VIEW WHERE ID=1;