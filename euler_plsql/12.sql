DECLARE
answer NUMERIC;
triangle_num NUMERIC := 0;
divisors_count PLS_INTEGER;
i PLS_INTEGER := 1;
    FUNCTION get_next_tri_num(num_in NUMERIC) RETURN NUMERIC
    AS
    BEGIN
        RETURN num_in * (num_in + 1)/2;
    END;
BEGIN
    WHILE answer IS NULL LOOP
        triangle_num := get_next_tri_num(i);
        divisors_count := EULER_PKG.get_divisors_count(triangle_num);
         
        IF divisors_count > 500 THEN
            answer := triangle_num;
        END IF;
         
        i :=  i+1;
    END LOOP;
     
    dbms_output.put_line(answer);
END;
--output: 76576500
 
 
/* EULER_PKG code added */
 
FUNCTION get_divisors_count(num_in NUMBER) RETURN PLS_INTEGER
IS
divisors PLS_INTEGER := 0;
BEGIN
    IF num_in > 1
    THEN
        FOR i IN 1..ROUND(SQRT(num_in),0) LOOP
            IF REMAINDER(num_in,i) = 0
            THEN
                divisors := divisors + 2;
            END IF;
        END LOOP;
    END IF;
     
    return divisors;
END get_divisors_count;