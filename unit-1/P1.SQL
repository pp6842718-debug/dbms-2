SET SERVEROUTPUT ON;
DECLARE
    v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
    v_name VARCHAR2(50) := 'Pavan';
    v_roll_no NUMBER := 23;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Roll Number: ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE(v_message);
    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || (v_roll_no MOD 7 + 1));
END;
/