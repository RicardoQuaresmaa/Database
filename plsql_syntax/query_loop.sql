BEGIN
   FOR cur_rec IN (SELECT employee_id asd FROM employees)
      
   LOOP
      DBMS_OUTPUT.PUT_LINE(cur_rec.asd);
   END LOOP;
   END;
   /
   
   
   
  