DECLARE
target INTEGER := 600851475143;
answer INTEGER := 0;
    FUNCTION Is_Prime(num INTEGER)
    RETURN BOOLEAN
    IS
        BEGIN
        --we don't need to go beyond the square root, as any factors beyond will have a LCM below
        FOR x IN 2..SQRT(num)
        LOOP 
            IF REMAINDER(num, x) = 0
            THEN
                RETURN FALSE;
            END IF;
        END LOOP;
         
        RETURN TRUE;
        END;
BEGIN
    --REVERSE since we're looking for the max value and we can stop once we find it
    FOR y IN REVERSE 1..SQRT(target)
    LOOP
        --value must be a factor of target AND prime
        IF REMAINDER(target,y) = 0 AND Is_Prime(y)
        THEN
            answer := y;
            EXIT;
        END IF;
    END LOOP;
     
dbms_output.put_line(answer);
 
END;
 
-- output: 6857