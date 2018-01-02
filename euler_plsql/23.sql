BEGIN
    FOR i IN 1..100 LOOP
        IF REMAINDER(i,3) = 0 AND REMAINDER(i,5) = 0 THEN
            dbms_output.put_line('FizzBuzz');
        ELSIF REMAINDER(i,3) = 0 THEN
            dbms_output.put_line('Fizz');
        ELSIF REMAINDER(i,5) = 0 THEN
            dbms_output.put_line('Buzz');
        ELSE
            dbms_output.put_line(i);
        END IF;
    END LOOP;
END;