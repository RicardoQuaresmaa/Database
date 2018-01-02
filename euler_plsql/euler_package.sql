CREATE OR REPLACE PACKAGE EULER.EULER_PKG AS
 
TYPE int_array IS VARRAY(2000) OF INTEGER;
FUNCTION is_even(num_in NUMBER) RETURN BOOLEAN;
FUNCTION is_prime(num_in NUMBER) RETURN BOOLEAN;
FUNCTION get_divisors(num_in NUMBER) RETURN int_array;
FUNCTION get_divisors_count(num_in NUMBER) RETURN PLS_INTEGER;
FUNCTION get_num_from_list(line_in VARCHAR2, num_in INTEGER) RETURN VARCHAR2;
PROCEDURE set_num_from_list(line_in IN OUT VARCHAR2, num_in INTEGER, new_val VARCHAR2);
 
END EULER_PKG;
/
 
 
CREATE OR REPLACE PACKAGE BODY EULER.EULER_PKG AS
 
FUNCTION is_even(num_in NUMBER) RETURN BOOLEAN IS
BEGIN
  IF REMAINDER(num_in, 2) = 0 
  THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF; 
END is_even;
 
FUNCTION is_prime(num_in NUMBER) RETURN BOOLEAN IS
  i PLS_INTEGER := 5;
BEGIN
  IF num_in <= 3
  THEN
      RETURN num_in > 1;
  ELSIF REMAINDER(num_in,2) = 0 OR REMAINDER(num_in,3) = 0
  THEN
      RETURN FALSE;
  ELSE
    WHILE i * i <= num_in
        LOOP
          IF REMAINDER(num_in,i) = 0 OR REMAINDER(num_in, i+2) = 0
          THEN
              RETURN FALSE;
          ELSE
              i := i + 6;
          END IF;
        END LOOP;
       
      RETURN TRUE;
  END IF;
END is_prime;
 
FUNCTION get_divisors(num_in NUMBER) RETURN int_array
IS
divisors_array int_array := int_array();
BEGIN
    IF num_in > 1
    THEN
        FOR i IN 1..ROUND(num_in/2,0) LOOP
            IF REMAINDER(num_in,i) = 0
            THEN
                divisors_array.extend;
                divisors_array(divisors_array.count) := i;
                --dbms_output.put_line('num_in: '||num_in||' i: '||i);
            END IF;
        END LOOP;
    END IF;
         
    divisors_array.extend;
    divisors_array(divisors_array.last) := num_in;
     
    return divisors_array;
END get_divisors;
 
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
 
FUNCTION get_num_from_list(line_in VARCHAR2, num_in INTEGER) 
    RETURN VARCHAR2
    AS
    --grabs a number from a line of numbers delimited by spaces
    BEGIN
        RETURN regexp_substr(line_in, '\S+', 1, num_in);
    END;
     
PROCEDURE set_num_from_list(line_in IN OUT VARCHAR2, num_in INTEGER, new_val VARCHAR2) 
    AS
    BEGIN
        line_in := REGEXP_REPLACE(line_in, '\S+', new_val, 1, num_in);
    END;
END EULER_PKG;
/