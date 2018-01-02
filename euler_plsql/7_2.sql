DECLARE
i PLS_INTEGER := 1;
prime_counter PLS_INTEGER := 0;
BEGIN
    WHILE prime_counter < 10001
    LOOP
    i:=i+1;
       
        IF EULER_PKG.is_prime(i)
        THEN
            prime_counter := prime_counter + 1;
        END IF;
    END LOOP;
 
    dbms_output.put_line(i);
END;
 
--output: 104743