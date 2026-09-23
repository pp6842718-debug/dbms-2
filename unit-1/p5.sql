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
VALUES
(102, 'John', 'Smith', 'IT_PROG', 60, 75000, DATE '2010-06-15');

INSERT INTO employees
(employee_id, first_name, last_name, job_id, department_id, salary, hire_date)
VALUES
(103, 'Rahul', 'Patel', 'SA_REP', 50, 55000, DATE '2020-03-10');

INSERT INTO employees
(employee_id, first_name, last_name, job_id, department_id, salary, hire_date)
VALUES
(104, 'Priya', 'Shah', 'HR_REP', 40, 60000, DATE '2015-08-20');
commit;


DECLARE
    v_emp employees%ROWTYPE;
    v_id NUMBER := 102; 
    v_yrs NUMBER;
BEGIN
    SELECT * INTO v_emp FROM employees WHERE employee_id = v_id;
    v_yrs := TRUNC(MONTHS_BETWEEN(SYSDATE, v_emp.hire_date)/12);
    
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || v_emp.job_id || ' | Dept ID: ' || v_emp.department_id);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || TO_CHAR(v_emp.salary, '99,999'));
    DBMS_OUTPUT.PUT_LINE('Hire Date: ' || TO_CHAR(v_emp.hire_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Years of Experience: ' || v_yrs);
    
    IF v_yrs > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Senior Employee');
    END IF;
END;
/