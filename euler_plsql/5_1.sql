DECLARE
lower_limit PLS_INTEGER := 1;
upper_limit PLS_INTEGER := 20;
answer PLS_INTEGER;
i PLS_INTEGER := 1;
BEGIN
    WHILE answer IS NULL
    LOOP
        FOR x IN lower_limit..upper_limit
        LOOP
            IF REMAINDER(i, x) = 0
            THEN
            --number is evenly divisible, do nothing to continue checking
                null;
            ELSE
            --attempt next number
                i := i + 1;
                exit;
            END IF;
             
            IF x = upper_limit
            THEN
            --final number is divisible which means we found our answer
                answer := i;
                dbms_output.put_line(answer);
            END IF;
             
        END LOOP;
    END LOOP;
END;
 
--output: 232792560