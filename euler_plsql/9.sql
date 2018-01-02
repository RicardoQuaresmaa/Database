DECLARE
a PLS_INTEGER := 0;
b PLS_INTEGER;
c PLS_INTEGER;
total PLS_INTEGER := 1000;
BEGIN
    WHILE a <= total/3 LOOP
    a := a + 1;
    b := a;
        WHILE b <= total/2 LOOP
        b := b + 1;
        c := total - a - b;
         
        IF c > 0 AND ( (a**2 + b**2) = c**2 )
        THEN
            dbms_output.put_line(a||', '||b||', '||c);
            dbms_output.put_line(a*b*c);
            EXIT;
        END IF;
        END LOOP;
    END LOOP;
 
END;
--output: 31875000