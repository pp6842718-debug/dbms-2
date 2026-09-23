SET SERVEROUTPUT ON;
DECLARE
    v_qty NUMBER := 2; 
    v_price NUMBER := 1400; 
    v_coupon NUMBER := NULL;
    v_gross NUMBER;
    v_disc NUMBER;
    v_taxable NUMBER;
    v_total NUMBER;
BEGIN
    v_gross := v_qty * v_price;
    v_disc := v_gross * NVL(v_coupon, 0) / 100;
    v_taxable := v_gross - v_disc;
   
    v_total := ROUND(v_taxable * 1.18); 
    
    DBMS_OUTPUT.PUT_LINE('Gross Amount: Rs. ' || v_gross);
    DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon, 'Coupon applied: ' || v_coupon || '% (Discount Rs. ' || v_disc || ')', 'No coupon applied.'));
    DBMS_OUTPUT.PUT_LINE('Taxable Amount: Rs. ' || v_taxable);
    DBMS_OUTPUT.PUT_LINE('Final Total (incl. 18% GST): Rs. ' || v_total);
END;
/