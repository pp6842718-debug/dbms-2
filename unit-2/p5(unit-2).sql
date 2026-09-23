DECLARE
    v_roll NUMBER := 10;
    v_N NUMBER := 5 + MOD(v_roll, 8);
    a NUMBER := 0; b NUMBER := 1; c NUMBER;
    v_is_prime BOOLEAN := TRUE;
    v_divisor NUMBER := 2;
BEGIN
   
    DBMS_OUTPUT.PUT_LINE('First ' || v_N || ' Fib numbers:');
    DBMS_OUTPUT.PUT(a || ' ' || b || ' ');
    FOR i IN 3..v_N LOOP
        c := a + b;
        DBMS_OUTPUT.PUT(c || ' ');
        a := b; b := c;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
    
    
    WHILE v_divisor <= SQRT(c) LOOP
        IF MOD(c, v_divisor) = 0 THEN v_is_prime := FALSE; EXIT; END IF;
        v_divisor := v_divisor + 1;
    END LOOP;
    IF v_is_prime AND c > 1 THEN DBMS_OUTPUT.PUT_LINE(c || ' is Prime'); 
    ELSE DBMS_OUTPUT.PUT_LINE(c || ' is NOT Prime'); END IF;
END;
/