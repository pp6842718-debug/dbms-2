DECLARE
    v_roll NUMBER := 10; v_att NUMBER := 51;
    v_th NUMBER := 31; v_pr NUMBER := 13; v_ass NUMBER := 15;
    v_tot NUMBER; v_grade VARCHAR2(15);
BEGIN
    IF v_ass > 10 THEN v_ass := 10; END IF; 
    v_tot := v_th + v_pr + v_ass;

    IF v_att < 40 THEN DBMS_OUTPUT.PUT_LINE('DETAINED (Attendance)');
    ELSIF v_th < 28 THEN DBMS_OUTPUT.PUT_LINE('FAIL in Theory');
    ELSIF v_pr < 12 THEN DBMS_OUTPUT.PUT_LINE('FAIL in Practical');
    ELSE
        v_grade := CASE 
            WHEN v_tot >= 80 THEN 'Distinction'
            WHEN v_tot >= 50 THEN 'Pass'
            ELSE 'D' END;
        DBMS_OUTPUT.PUT_LINE('Roll: ' || v_roll || ' | Total: ' || v_tot || ' | Status: PASS - ' || v_grade);
    END IF;
END;
/