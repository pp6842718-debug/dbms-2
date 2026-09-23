SET SERVEROUTPUT ON;
DECLARE
    v_p NUMBER := 10000; 
    v_r NUMBER := 6.5; 
    v_t NUMBER := 3;
    v_si NUMBER;
    v_ci NUMBER;
    v_diff_pct NUMBER;
BEGIN
    v_si := (v_p * v_r * v_t) / 100;
    v_ci := v_p * POWER(1 + v_r/100, v_t) - v_p;
    
    DBMS_OUTPUT.PUT_LINE('Simple Interest: Rs.' || TO_CHAR(v_si, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Compound Interest: Rs.' || TO_CHAR(v_ci, '99,999.99'));
    
    v_diff_pct := ((v_ci - v_si) / v_si) * 100;
    
    IF v_diff_pct > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.');
    END IF;
END;
/