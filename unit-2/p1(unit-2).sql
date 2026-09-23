DECLARE
    v_name VARCHAR2(50) := 'Pavan Patel';
    v_roll NUMBER := 10;
    m1 NUMBER := 85; m2 NUMBER := 72; m3 NUMBER := 90; m4 NUMBER := 65; m5 NUMBER := 78;
    v_total NUMBER; v_pct NUMBER; v_grade VARCHAR2(2); v_class VARCHAR2(20);
BEGIN
    v_total := m1 + m2 + m3 + m4 + m5;
    v_pct := v_total / 5;
    
    IF v_pct >= 90 THEN v_grade := 'A+';
    ELSIF v_pct >= 80 THEN v_grade := 'A';
    ELSIF v_pct >= 70 THEN v_grade := 'B';
    ELSIF v_pct >= 60 THEN v_grade := 'C';
    ELSIF v_pct >= 50 THEN v_grade := 'D';
    ELSE v_grade := 'F'; END IF;

    IF m1 < 35 OR m2 < 35 OR m3 < 35 OR m4 < 35 OR m5 < 35 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ' (Roll ' || v_roll || ') Result: DETAINED');
        IF m1 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject 1'); END IF;
        
    ELSE
        IF v_pct >= 75 THEN v_class := 'Distinction';
        ELSIF v_pct >= 60 THEN v_class := 'First';
        ELSIF v_pct >= 50 THEN v_class := 'Second';
        ELSE v_class := 'Pass'; END IF;
        
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ' | Total: ' || v_total || ' | Pct: ' || v_pct || '%');
        DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade || ' | Class: ' || v_class);
    END IF;
END;
/