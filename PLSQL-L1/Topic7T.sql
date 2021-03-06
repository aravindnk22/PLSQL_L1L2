/*Assignment 1:*/

CREATE OR REPLACE PROCEDURE SECURE_DML
IS
BEGIN 
IF(TO_CHAR(SYSDATE,'MON')<>'MAR') 
THEN RAISE_APPLICATION_ERROR(-20000,'You can modify or add a department only at the end of a financial year');
END IF; 
END;

CREATE OR REPLACE TRIGGER TR_CHECK_DEPT
BEFORE INSERT OR UPDATE OR DELETE
ON DEPARTMENT
BEGIN
SECURE_DML;
END;

BEGIN
INSERT INTO DEPARTMENT VALUES(1500,'SALES-BICYCLES',null,null);
COMMIT;
END;


SELECT * FROM DEPARTMENT;
DELETE FROM DEPARTMENT WHERE DEPARTMENT_NAME='SALES-BICYCLES';