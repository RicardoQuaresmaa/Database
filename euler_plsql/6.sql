DECLARE
lower_limit PLS_INTEGER := 1;
upper_limit PLS_INTEGER := 100;
sum_of_sq PLS_INTEGER := 0;
sq_of_sum PLS_INTEGER := 0;
BEGIN
    FOR x IN lower_limit..upper_limit
    LOOP
        sum_of_sq := sum_of_sq + x**2;
        sq_of_sum := sq_of_sum + x;
    END LOOP;
     
    sq_of_sum := POWER(sq_of_sum,2);
 
    dbms_output.put_line(sq_of_sum-sum_of_sq);
END;
 
--output: 25164150