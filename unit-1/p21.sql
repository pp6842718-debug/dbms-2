CREATE TABLE employees (
    employee_id    NUMBER(6) PRIMARY KEY,
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(25) NOT NULL,
    job_id         VARCHAR2(10),
    department_id  NUMBER(4),
    salary         NUMBER(10,2),
    hire_date      DATE
);

INSERT INTO employees
(employee_id, first_name, last_name, job_id, department_id, salary, hire_date)
VALUES
(110, 'Arun', 'Kumar', 'IT_PROG', 60, 50000, DATE '2020-01-15');

COMMIT;
SET SERVEROUTPUT ON;
DECLARE
    v_emp employees%ROWTYPE;
    v_id NUMBER := 110; 
    v_da NUMBER;
    v_hra NUMBER;
    v_pf NUMBER;
    v_net NUMBER;
BEGIN
    SELECT * INTO v_emp FROM employees WHERE employee_id = v_id;
    
    v_da := v_emp.salary * 0.40;
    v_hra := v_emp.salary * 0.20;
    v_pf := v_emp.salary * 0.12;
    v_net := v_emp.salary + v_da + v_hra - v_pf;
    
    DBMS_OUTPUT.PUT_LINE('--- SALARY SLIP ---');
    DBMS_OUTPUT.PUT_LINE('Month: ' || TO_CHAR(SYSDATE, 'Month YYYY'));
    DBMS_OUTPUT.PUT_LINE('Emp Name: ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('Basic Salary:', 20) || LPAD(TO_CHAR(v_emp.salary, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE(RPAD('DA (40%):', 20) || LPAD(TO_CHAR(v_da, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE(RPAD('HRA (20%):', 20) || LPAD(TO_CHAR(v_hra, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE(RPAD('PF (12%):', 20) || LPAD('-' || TO_CHAR(v_pf, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 35, '-'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Net Pay:', 20) || LPAD(TO_CHAR(v_net, '99,99,999.99'), 15));
END;
/