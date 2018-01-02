DECLARE
lower_range PLS_INTEGER := 100;
upper_range PLS_INTEGER := 999;
product VARCHAR2(1000);
reverse_product VARCHAR2(1000);
answer PLS_INTEGER := 0;
BEGIN
    FOR x IN REVERSE lower_range..upper_range
    LOOP
        FOR y IN REVERSE lower_range..upper_range
        LOOP
            product := x * y;
             
            --we can exit as our y value is too low
            IF product < answer
            THEN
                exit;
            END IF;
 
            SELECT REVERSE(product)
            INTO reverse_product
            FROM dual;
             
            IF product = reverse_product AND product >  answer
            THEN
                answer := product;
                EXIT;
            END IF;
        END LOOP;
    END LOOP;
     
    dbms_output.put_line(answer);
END;
 
--output: 906609