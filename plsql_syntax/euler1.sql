DECLARE
upper_limit INTEGER := 999;
answer INTEGER := 0;
BEGIN
    FOR i IN  1..upper_limit
    LOOP
        --check if i is divisible by 3 or 5
        IF REMAINDER(i,3) = 0 OR REMAINDER(i,5) = 0
        THEN
            answer := answer + i;
        END IF;
    END LOOP;
  
dbms_output.put_line(answer);
END;/