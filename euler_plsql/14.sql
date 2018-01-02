DECLARE
i NUMERIC;
chain_length PLS_INTEGER := 0;
answer PLS_INTEGER := 0;
answer_jumps PLS_INTEGER := 0;
    FUNCTION func_even(n_in NUMERIC) RETURN NUMERIC
    IS
    BEGIN
        RETURN n_in/2;
    END;
    FUNCTION func_odd(n_in NUMERIC) RETURN NUMERIC
    IS
    BEGIN
        RETURN (n_in*3)+1;
    END;
BEGIN
    FOR x IN 2..1000000 LOOP
         
        IF EULER_PKG.is_even(x) THEN
            CONTINUE;
        END IF;
     
        i := x;
        chain_length := 0;
         
        WHILE i != 1 LOOP
        
            IF EULER_PKG.is_even(i) THEN
                i := func_even(i);
            ELSE
                i := func_odd(i);
            END IF;   
             
            chain_length := chain_length + 1;
        END LOOP;
         
        IF chain_length > answer_jumps THEN
            answer_jumps := chain_length;
            answer := x;
        END IF;
    END LOOP;
     
    dbms_output.put_line(answer);
END;
 
--output: 837799