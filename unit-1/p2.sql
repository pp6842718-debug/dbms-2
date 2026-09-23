SET SERVEROUTPUT ON;
DECLARE
    v_name VARCHAR2(50) := 'Pavan';
    v_marks NUMBER(5,2) := 420;
    v_percentage NUMBER(5,2);
    v_dob DATE := TO_DATE('2002-05-15', 'YYYY-MM-DD');
    v_passed BOOLEAN;
BEGIN
    v_percentage := ROUND((v_marks/500)*100, 2);
    v_passed := v_percentage >= 40;

    DBMS_OUTPUT.PUT_LINE(v_name || ' | Marks: ' || v_marks || ' | %: ' || v_percentage);
    DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY'));

    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/