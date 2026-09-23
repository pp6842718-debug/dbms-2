DECLARE
    v_roll NUMBER := 10;
    v_balance NUMBER := (v_roll * 500) + 5000; 
    v_txns NUMBER := 0;
    v_choice NUMBER;
    v_amt NUMBER;
BEGIN
    
    FOR i IN 1..4 LOOP
        v_choice := CASE i WHEN 1 THEN 1 WHEN 2 THEN 1 WHEN 3 THEN 1 ELSE 3 END;
        v_amt := 1000;
        
        EXIT WHEN v_choice = 3 OR v_balance = 0;
        
        IF v_choice = 1 THEN
            IF v_amt <= 0 OR MOD(v_amt, 100) != 0 OR v_amt > 10000 THEN
                DBMS_OUTPUT.PUT_LINE('Invalid amount rules.');
            ELSIF v_amt > v_balance THEN
                DBMS_OUTPUT.PUT_LINE('Insufficient funds.');
            ELSE
                v_balance := v_balance - v_amt;
                v_txns := v_txns + 1;
                DBMS_OUTPUT.PUT_LINE('Withdrew: ' || v_amt || ' | Remaining: ' || v_balance);
            END IF;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total Txns: ' || v_txns || ' | Final Balance: ' || v_balance);
END;
/