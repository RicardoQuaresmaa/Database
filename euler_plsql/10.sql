DECLARE
answer NUMERIC := 0;
upper_limit PLS_INTEGER := 2000000;
i PLS_INTEGER := 1;
BEGIN
    FOR i IN 1..upper_limit LOOP
        IF EULER_PKG.is_prime(i)
        THEN
            answer := answer + i;
        END IF;
    END LOOP;
     
    dbms_output.put_line(answer);
END;
--output: 142913828922