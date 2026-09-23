CREATE TABLE employees (
    employee_id    NUMBER(6) PRIMARY KEY,
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(25) NOT NULL,
    job_id         VARCHAR2(10) NOT NULL,
    department_id  NUMBER(4),
    salary         NUMBER(8,2),
    hire_date      DATE
);

INSERT INTO employees
(employee_id, first_name, last_name, job_id, department_id, salary, hire_date)
VALUES (101, 'John', 'Smith', 'IT_PROG', 60, 75000, DATE '2010-06-15');

INSERT INTO employees
(employee_id, first_name, last_name, job_id, department_id, salary, hire_date)
VALUES (102, 'Rahul', 'Patel', 'SA_REP', 50, 55000, DATE '2012-03-10');

INSERT INTO employees
(employee_id, first_name, last_name, job_id, department_id, salary, hire_date)
VALUES (103, 'Priya', 'Shah', 'SA_REP', 50, 65000, DATE '2015-08-20');

INSERT INTO employees
(employee_id, first_name, last_name, job_id, department_id, salary, hire_date)
VALUES (104, 'Amit', 'Kumar', 'SA_REP', 50, 60000, DATE '2018-01-12');

INSERT INTO employees
(employee_id, first_name, last_name, job_id, department_id, salary, hire_date)
VALUES (105, 'Neha', 'Patel', 'HR_REP', 40, 50000, DATE '2020-05-25');

COMMIT;

SET SERVEROUTPUT ON;
DECLARE
    v_dept NUMBER := 50; 
    v_cnt NUMBER;
    v_avg NUMBER;
    v_max NUMBER;
BEGIN
    SELECT COUNT(*), ROUND(AVG(salary), 2), NVL(MAX(salary), 0) 
    INTO v_cnt, v_avg, v_max 
    FROM employees 
    WHERE department_id = v_dept;
    
    DBMS_OUTPUT.PUT_LINE('Department ' || v_dept || ' Summary:');
    DBMS_OUTPUT.PUT_LINE('Employee Count: ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('Avg Salary: Rs. ' || NVL(v_avg, 0));
    DBMS_OUTPUT.PUT_LINE('Max Salary: Rs. ' || v_max);
    
    -- Explanation: SELECT INTO with COUNT(*) always returns exactly one row (a number, even if it is 0). 
    -- Because a row is successfully returned, NO_DATA_FOUND is never raised.
END;
/