SET SERVEROUTPUT ON;
DECLARE
    v_name VARCHAR2(50) := 'Pavan Patel'; 
    v_roll NUMBER := 10;
    v_dob DATE := TO_DATE('15-MAY-2002', 'DD-MON-YYYY');
    v_upper VARCHAR2(50);
    v_first VARCHAR2(50);
    v_id VARCHAR2(20);
    v_age NUMBER;
BEGIN
    v_upper := UPPER(v_name);
    v_first := SUBSTR(v_name, 1, INSTR(v_name, ' ')-1);
    v_id := 'LJICA' || TO_CHAR(v_dob, 'YYYY') || LPAD(v_roll, 3, '0');
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob)/12);
    
    DBMS_OUTPUT.PUT_LINE(RPAD('ID CARD', 20, '-'));
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_upper);
    DBMS_OUTPUT.PUT_LINE('First Name:   ' || v_first);
    DBMS_OUTPUT.PUT_LINE('ID Number:    ' || v_id);
    DBMS_OUTPUT.PUT_LINE('Age:          ' || v_age);
    
    IF LENGTH(v_name) > 20 THEN
        DBMS_OUTPUT.PUT_LINE('Abbreviated: ' || v_first || ' ' || SUBSTR(v_name, INSTR(v_name, ' ')+1, 1));
    END IF;
END;
/