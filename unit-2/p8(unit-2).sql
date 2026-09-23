DECLARE
    v_sal NUMBER := 25000; v_loan NUMBER := 250000;
    v_rate NUMBER := 10; v_tenure NUMBER := 60;
    v_foir NUMBER; v_r NUMBER; v_emi NUMBER;
    v_status VARCHAR2(20);
BEGIN
    v_foir := v_sal * 0.40;
    v_r := (v_rate / 12) / 100;

    IF v_sal < 25000 OR v_loan > (v_sal * 60) THEN
        v_status := 'REJECTED';
    ELSE
        v_emi := (v_loan * v_r * POWER(1 + v_r, v_tenure)) / (POWER(1 + v_r, v_tenure) - 1);
        
        WHILE v_emi > v_foir AND v_loan > 0 LOOP
            v_loan := v_loan - 10000;
            v_emi := (v_loan * v_r * POWER(1 + v_r, v_tenure)) / (POWER(1 + v_r, v_tenure) - 1);
        END LOOP;
        
        IF v_loan <= 0 THEN v_status := 'REJECTED';
        ELSE v_status := 'APPROVED'; END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('FOIR: ' || v_foir || ' | Approved Amount: ' || v_loan);
    DBMS_OUTPUT.PUT_LINE('EMI: ' || ROUND(v_emi) || ' | Status: ' || v_status);
END;
/