CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name  VARCHAR2(50),
    salary      NUMBER(10,2)
);

INSERT INTO employees (employee_id, first_name, salary)
VALUES (103, 'Rahul', 50000);

INSERT INTO employees (employee_id, first_name, salary)
VALUES (104, 'Priya', 60000);

COMMIT;
SET SERVEROUTPUT ON;

DECLARE
    v_fname employees.first_name%TYPE;
    v_sal   employees.salary%TYPE;
    v_id    NUMBER := 103;

BEGIN
    SELECT first_name, salary
    INTO v_fname, v_sal
    FROM employees
    WHERE employee_id = v_id;

    DBMS_OUTPUT.PUT_LINE(
        'Employee: ' || v_fname ||
        ' earns Rs. ' || v_sal ||
        ' per month.'
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found. Check the ID.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/