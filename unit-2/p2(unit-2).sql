DECLARE
    v_gross NUMBER := 1000000; 
    v_std_deduct NUMBER := 75000;
    v_taxable NUMBER;
    v_tax NUMBER := 0;
BEGIN
    v_taxable := v_gross - v_std_deduct;
    IF v_taxable < 0 THEN v_taxable := 0; END IF;

    CASE 
        WHEN v_taxable <= 300000 THEN v_tax := 0;
        WHEN v_taxable <= 700000 THEN v_tax := (v_taxable - 300000) * 0.05;
        WHEN v_taxable <= 1000000 THEN v_tax := 20000 + (v_taxable - 700000) * 0.10;
        WHEN v_taxable <= 1200000 THEN v_tax := 50000 + (v_taxable - 1000000) * 0.15;
        WHEN v_taxable <= 1500000 THEN v_tax := 80000 + (v_taxable - 1200000) * 0.20;
        ELSE v_tax := 140000 + (v_taxable - 1500000) * 0.30;
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Gross: ' || v_gross || ' | Taxable: ' || v_taxable);
    IF v_tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No tax this year - save more with PPF/ELSS!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total Tax: ' || v_tax || ' | TDS/Month: ' || ROUND(v_tax/12));
    END IF;
END;
/