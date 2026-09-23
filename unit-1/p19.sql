SET SERVEROUTPUT ON;
<<bank>>
DECLARE
    v_bank VARCHAR2(30) := 'LJ Bank';
    v_total_deposit NUMBER := 0;
BEGIN
    <<branch>>
    DECLARE
        v_branch VARCHAR2(30) := 'Ahmedabad'; 
        v_dep NUMBER := 10000;
    BEGIN
        bank.v_total_deposit := bank.v_total_deposit + v_dep;
        
        <<counter>>
        DECLARE
            v_token NUMBER := 1;
        BEGIN
            DBMS_OUTPUT.PUT_LINE(bank.v_bank || ' | ' || branch.v_branch || ' | Token ' || v_token);
        END;
        
        -- PLS-00201: identifier 'V_TOKEN' must be declared
        -- DBMS_OUTPUT.PUT_LINE('Token is: ' || v_token);
    END;
    DBMS_OUTPUT.PUT_LINE('Total Deposit at Bank Level: Rs. ' || v_total_deposit);
END;
/