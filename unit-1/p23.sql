CREATE TABLE employees (
    employee_id NUMBER(6) PRIMARY KEY,
    first_name  VARCHAR2(50),
    last_name   VARCHAR2(50),
    salary      NUMBER(10,2)
);

INSERT INTO employees
(employee_id, first_name, last_name, salary)
VALUES
(100, 'yash', 'Smith', 30000);

COMMIT;
SET SERVEROUTPUT ON;
DECLARE
   
    v_name VARCHAR2(50) := 'Pavan Patel';
   
    c_bonus_rate CONSTANT NUMBER := 0.1; 
    
    v_sal NUMBER := 30000; 
    v_bonus NUMBER;
    
    v_fname VARCHAR2(50);
BEGIN
    v_bonus := v_sal * c_bonus_rate;
    
    SELECT first_name INTO v_fname FROM employees WHERE employee_id = 100;
   
    DBMS_OUTPUT.PUT_LINE('Bonus for ' || v_name || ': Rs. ' || v_bonus);
END;
/