SET SERVEROUTPUT ON;
DECLARE
    v_p NUMBER := 150000; 
    v_annual_rate NUMBER := 9;
    v_years NUMBER := 5;
    v_r NUMBER;
    v_n NUMBER;
    v_emi NUMBER;
    v_total_pay NUMBER;
    v_total_int NUMBER;
    v_int_pct NUMBER;
BEGIN
    v_r := v_annual_rate / 12 / 100;
    v_n := v_years * 12;
    v_emi := ROUND(v_p * v_r * POWER(1 + v_r, v_n) / (POWER(1 + v_r, v_n) - 1), 2);
    
    v_total_pay := v_emi * v_n;
    v_total_int := v_total_pay - v_p;
    v_int_pct := ROUND((v_total_int / v_total_pay) * 100, 2);
    
    DBMS_OUTPUT.PUT_LINE('EMI: Rs. ' || TO_CHAR(v_emi, '99,99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Total Payment: Rs. ' || TO_CHAR(v_total_pay, '99,99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Total Interest: Rs. ' || TO_CHAR(v_total_int, '99,99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Interest is ' || v_int_pct || '% of your total payment.');
END;
/