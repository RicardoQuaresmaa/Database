BEGIN
  DBMS_OUTPUT.PUT_LINE ('lower_bound < upper_bound');
 
 FOR i IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;
END;
/