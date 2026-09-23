SET SERVEROUTPUT ON;
DECLARE
    v_name VARCHAR2(50) := 'Pavan';
    v_roll NUMBER := 10;
    v_dob DATE := TO_DATE('15-MAY-2002', 'DD-MON-YYYY'); 
    v_pnr VARCHAR2(20);
    v_jdate DATE;
    v_base_fare NUMBER := 700; 
    v_final_fare NUMBER;
    v_age NUMBER;
BEGIN
    v_pnr := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') || LPAD(v_roll, 4, '0');
    v_jdate := SYSDATE + (v_roll MOD 30 + 1);
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);
    
    v_final_fare := NVL2(CASE WHEN v_age >= 60 THEN 'Yes' ELSE NULL END, v_base_fare * 0.6, v_base_fare);
    
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 30, '-'));
    DBMS_OUTPUT.PUT_LINE('IRCTC TICKET');
    DBMS_OUTPUT.PUT_LINE('PNR: ' || v_pnr);
    DBMS_OUTPUT.PUT_LINE('Passenger: ' || v_name || ' (Age: ' || v_age || ')');
    DBMS_OUTPUT.PUT_LINE('Journey: ' || TO_CHAR(v_jdate, 'Day, DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Total Fare: Rs. ' || v_final_fare);
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 30, '-'));
END;
/