DECLARE
target INTEGER := 600851475143;
current_factor INTEGER := 2;
answer INTEGER := 1; 
    PROCEDURE remove_factors(int_in INTEGER)
    IS
    BEGIN
       IF REMAINDER(target, int_in) = 0
       THEN
            answer := int_in;
            target := target/int_in;
            WHILE REMAINDER(target, int_in) = 0
            LOOP
                target := target/int_in;
            END LOOP;
       END IF;
    END;
BEGIN
    WHILE target > 1
    LOOP
      IF current_factor = 2
      THEN
        remove_factors(current_factor);
        current_factor := 3;
      ELSE
        remove_factors(current_factor);
        current_factor := current_factor + 2;
      END IF;
    END LOOP;
     
dbms_output.put_line(answer);
 
END;
 
-- output: 6857