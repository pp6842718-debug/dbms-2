SET SERVEROUTPUT ON;
<<outer>>
DECLARE
    v_city VARCHAR2(30) := 'Gujarat';
    v_num NUMBER := 100;
BEGIN
    <<middle>>
    DECLARE
        v_city VARCHAR2(30) := 'Ahmedabad';
        v_num NUMBER := 200;
    BEGIN
        <<inner>>
        DECLARE
            v_num NUMBER := 300;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Inner Block - City: ' || v_city || ', Num: ' || v_num);
        END;
        DBMS_OUTPUT.PUT_LINE('Middle Block - City: ' || v_city || ', Num: ' || v_num);
        DBMS_OUTPUT.PUT_LINE('Outer City from Middle: ' || outer.v_city);
    END;
    DBMS_OUTPUT.PUT_LINE('Outer Block - City: ' || v_city || ', Num: ' || v_num);
END;
/