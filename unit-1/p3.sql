SET SERVEROUTPUT ON;
DECLARE
    c_gst_rate CONSTANT NUMBER := 18;
    v_base_price NUMBER := 6000; 
    v_cgst NUMBER;
    v_sgst NUMBER;
    v_total NUMBER;
    v_city VARCHAR2(50) := NULL;
BEGIN
  
    v_cgst := v_base_price * 9/100;
    v_sgst := v_base_price * 9/100;
    v_total := v_base_price + v_cgst + v_sgst;
    
    DBMS_OUTPUT.PUT_LINE('Base Price: Rs.' || v_base_price);
    DBMS_OUTPUT.PUT_LINE('CGST: Rs.' || v_cgst || ' | SGST: Rs.' || v_sgst);
    DBMS_OUTPUT.PUT_LINE('Total: Rs.' || v_total);

  
    DBMS_OUTPUT.PUT_LINE('NVL Output: ' || NVL(v_city, 'Ahmedabad'));
    DBMS_OUTPUT.PUT_LINE('NVL2 Output: ' || NVL2(v_city, 'City Known: ' || v_city, 'City Unknown'));
END;
/