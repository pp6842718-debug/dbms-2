SET SERVEROUTPUT ON;
DECLARE
    v_amt NUMBER := 2370;
    v_n500 NUMBER;
    v_n200 NUMBER;
    v_n100 NUMBER;
    v_rem NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Withdrawal Amount: Rs. ' || v_amt);
    
    v_n500 := TRUNC(v_amt / 500);
    v_rem := MOD(v_amt, 500);
    
    v_n200 := TRUNC(v_rem / 200);
    v_rem := MOD(v_rem, 200);
    
    v_n100 := TRUNC(v_rem / 100);
    v_rem := MOD(v_rem, 100);
    
    DBMS_OUTPUT.PUT_LINE('500 Notes: ' || v_n500);
    DBMS_OUTPUT.PUT_LINE('200 Notes: ' || v_n200);
    DBMS_OUTPUT.PUT_LINE('100 Notes: ' || v_n100);
    DBMS_OUTPUT.PUT_LINE('Undispensed Balance: Rs. ' || v_rem);
END;
/