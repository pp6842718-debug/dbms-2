SET SERVEROUTPUT ON;

DECLARE
    v_roll   NUMBER := 10;
    v_table  NUMBER := MOD(v_roll, 9) + 2;
    v_height NUMBER := 5 + MOD(v_roll, 5);

BEGIN
    
    DBMS_OUTPUT.PUT_LINE('--- Multiplication Table ---');

    FOR i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(
            v_table || ' x ' || i || ' = ' || (v_table * i)
        );
    END LOOP;

    
    DBMS_OUTPUT.PUT_LINE('--- Reverse Triangle ---');

    FOR i IN REVERSE 1..v_height LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*', i, '*'));
    END LOOP;

   
    DBMS_OUTPUT.PUT_LINE('--- Number Pyramid ---');

    FOR i IN 1..6 LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT(j);
        END LOOP;

        DBMS_OUTPUT.NEW_LINE;
    END LOOP;

END;
/