DECLARE
    v_dist NUMBER := 5; v_food_val NUMBER := 350;
    v_base NUMBER := 0; v_surcharge NUMBER := 0;
    v_rain BOOLEAN := TRUE; v_first_order BOOLEAN := FALSE;
BEGIN
    IF v_dist < 3 THEN v_base := 0;
    ELSIF v_dist <= 8 THEN v_base := 29;
    ELSIF v_dist <= 15 THEN v_base := 49;
    ELSE v_base := 79; END IF;

   
    v_surcharge := CASE WHEN v_rain THEN v_base * 0.20 ELSE 0 END;
    
    v_base := v_base + v_surcharge;

    IF v_food_val > 499 THEN v_base := 0;
    ELSIF v_first_order THEN v_base := v_base * 0.5; END IF;

    DBMS_OUTPUT.PUT_LINE('Food: ' || v_food_val || ' | Final Delivery: ' || ROUND(v_base));
    DBMS_OUTPUT.PUT_LINE('Grand Total: ' || ROUND(v_food_val + v_base));
END;
/