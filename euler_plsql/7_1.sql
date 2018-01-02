DECLARE
i PLS_INTEGER := 1; --current number being checked for prime-ness
prime_counter PLS_INTEGER := 0; --keeps track of how many primes we have found
prime BOOLEAN;
BEGIN
    WHILE prime_counter < 10001
    LOOP
    i:=i+1;
    prime := true;
        FOR x IN 2..i-1
        LOOP
            IF REMAINDER(i,x) = 0
            THEN
                --number isn't prime
                prime := false;
                exit;
            END IF;
        END LOOP;
         
        IF prime
        THEN
            prime_counter := prime_counter + 1;
        END IF;
    END LOOP;
 
    dbms_output.put_line(i);
END;
 
--output: 104743