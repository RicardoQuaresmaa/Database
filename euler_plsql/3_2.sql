DECLARE
target INTEGER := 14;
current_factor INTEGER := 3;
answer INTEGER := 1; --tracks the GPF along the way
BEGIN
    /*first check to see if we can reduce our possible range by dividing by 2
      and we don't need to check any other even numbers*/
   IF REMAINDER(target, 2) = 0
   THEN
        answer := 2;
        target := target/2;
        WHILE REMAINDER(target, 2) = 0
        LOOP
            target := target/2;
        END LOOP;
   END IF;
    
   WHILE target > 1
   LOOP
    /*same type of logic as above, this time starting with 3 and incrementing
      to each odd number.*/
    IF REMAINDER(target,current_factor) = 0
    THEN
        target := target/current_factor;
        answer := current_factor;
        WHILE REMAINDER(target, current_factor) = 0
        LOOP
            target := target/current_factor;
        END LOOP;
    ELSE   
        current_factor := current_factor + 2;
    END IF;
   END LOOP;
     
dbms_output.put_line(answer);
 
END;
 
--output: 7