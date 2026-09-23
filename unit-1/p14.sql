SET SERVEROUTPUT ON;
DECLARE
    c_gst CONSTANT NUMBER := 18;
    v_plan NUMBER := 399; 
    v_gst_amt NUMBER;
    v_total NUMBER;
BEGIN
    v_gst_amt := v_plan * (c_gst / 100);
    v_total := v_plan + v_gst_amt;
    
    DBMS_OUTPUT.PUT_LINE(RPAD('Plan:', 15) || TO_CHAR(v_plan, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('GST (18%):', 15) || TO_CHAR(v_gst_amt, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Total:', 15) || TO_CHAR(v_total, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Valid Until:   ' || TO_CHAR(SYSDATE + 28, 'DD-MON-YYYY'));
END;
/