DECLARE
upper_limit INTEGER := 4000000;
answer INTEGER := 0;
a INTEGER := 1;
b INTEGER := 2;
c INTEGER := 0; --must declare an initial value; NULL !< any number
BEGIN
    WHILE c < upper_limit
    LOOP
        c := a + b;
         
        --check if number is even
        IF REMAINDER(b,2) = 0
        THEN
            answer := answer + b;
        END IF;
         
        a := b;
        b := c;
    END LOOP;
 
dbms_output.put_line(answer);
END;
 
-- output: 4613732