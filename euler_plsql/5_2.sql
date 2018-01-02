DECLARE
lower_limit PLS_INTEGER := 2;
upper_limit PLS_INTEGER := 20;
answer PLS_INTEGER;
i PLS_INTEGER := upper_limit;
is_i_even BOOLEAN;
BEGIN
    --see if our starting point is even or odd
    IF REMAINDER(i,2) = 0
    THEN
        is_i_even := TRUE;
    ELSE
        is_i_even := FALSE;
    END IF;
      
    WHILE answer IS NULL
    LOOP
        FOR x IN REVERSE lower_limit..upper_limit
        LOOP
            IF REMAINDER(i, x) = 0
            THEN
            --number is evenly divisible
                IF x = lower_limit
                THEN
                    answer := i;
                    dbms_output.put_line(answer);
                END IF;
            ELSE
                IF is_i_even
                THEN
                    i := i + 2;
                    exit;
                ELSE
                --we only get here if the number is odd to start with
                    i := i + 1;
                    is_i_even := TRUE;
                    exit;
                END IF;
            END IF;
        END LOOP;
    END LOOP;
END;
 
--output: 232792560