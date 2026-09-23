CREATE TABLE departments (
    department_id   NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(60),
    location_id     NUMBER(4)
);

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (10, 'Administration', 1700);

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (20, 'Marketing', 1800);

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (30, 'Purchasing', 1700);

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (40, 'Human Resources', 2400);

COMMIT;
SET SERVEROUTPUT ON;
DECLARE
    v_dname departments.department_name%TYPE;
    v_loc departments.location_id%TYPE;
    v_id NUMBER := 20; 
BEGIN
    SELECT department_name, location_id INTO v_dname, v_loc 
    FROM departments WHERE department_id = v_id;
    
    DBMS_OUTPUT.PUT_LINE('Dept ' || v_id || ': ' || v_dname || ' at location ' || v_loc);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department not found.');
        
    
END;
/