SET SERVEROUTPUT ON;
DECLARE
    v_raw VARCHAR2(100) := '   pAVAN pATEL '; 
    v_clean VARCHAR2(100);
    v_first VARCHAR2(50);
    v_last VARCHAR2(50);
    v_email VARCHAR2(100);
BEGIN
   
    v_clean := INITCAP(REPLACE(REPLACE(TRIM(v_raw), '  ', ' '), '  ', ' '));
    
    v_first := SUBSTR(v_clean, 1, INSTR(v_clean, ' ') - 1);
    v_last := SUBSTR(v_clean, INSTR(v_clean, ' ') + 1);
    v_email := LOWER(v_first ||'.'|| v_last || '@ljku.edu.in');
    
    DBMS_OUTPUT.PUT_LINE('Cleaned: [' || v_clean || ']');
    DBMS_OUTPUT.PUT_LINE('First: ' || v_first || ' | Last: ' || v_last);
    DBMS_OUTPUT.PUT_LINE('College Email: ' || v_email);
    DBMS_OUTPUT.PUT_LINE('Length Before: ' || LENGTH(v_raw) || ' | After: ' || LENGTH(v_clean));
END;
/