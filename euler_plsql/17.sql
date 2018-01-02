DECLARE
total INTEGER := 0;
FUNCTION handle_LT_twenty(x INTEGER) RETURN INTEGER --handle "less than" twenty
IS
char_count INTEGER;
BEGIN
    IF x IN (1,2,6,10)
        THEN
            char_count := 3;
        ELSIF x IN (4,5,9)
        THEN
            char_count := 4;
        ELSIF x IN (3,7,8)
        THEN
            char_count := 5;
        ELSIF x IN (11,12)
        THEN
            char_count := 6;
        ELSIF x IN (15,16)
        THEN
            char_count := 7;
        ELSIF x IN (13,14,18,19)
        THEN
            char_count := 8;
        ELSIF x IN (17)
        THEN
            char_count := 9;
    END IF;
     
    return char_count;
END;
FUNCTION count_chars(x INTEGER) RETURN INTEGER
IS
char_count INTEGER := 0;
ones_digit INTEGER := SUBSTR(x,-1,1); -- right-most digit
tens_digit INTEGER := SUBSTR(x,-2,1);
hundreds_digit INTEGER := SUBSTR(x,-3,1);
thousands_digit INTEGER := SUBSTR(x,-4,1);
BEGIN
 
    --handle for cases of 19 and less
    IF tens_digit IN (1) OR length(x) < 2
    THEN
        char_count := handle_LT_twenty(tens_digit||ones_digit);
    ELSE
    --handle the tens digit for 20 and higher
        IF tens_digit IN (2,3,8,9) THEN -- "twenty", "thirty", etc.
           char_count := 6;
        ELSIF tens_digit IN (4,5,6) THEN -- "forty", "fifty", etc.
            char_count := 5;
        ELSIF tens_digit IN (7) THEN -- "seventy"
            char_count := 7;
        END IF;
         
        IF ones_digit != 0
        THEN
            char_count := char_count + handle_LT_twenty(ones_digit);
        END IF;
         
    END IF;
 
    IF length(x) >= 3 AND hundreds_digit != 0 THEN --dealing with hundreds
        char_count := char_count + handle_LT_twenty(hundreds_digit); --hundred digit follows same rules as single digit, "one" hundred
         
        IF tens_digit+ones_digit = 0
        THEN
            char_count := char_count + length('hundred'); -- 100 = "onehundred"
        ELSE
             
            char_count := char_count + length('hundredand'); --no spaces! 101 = "onehundredandone"
        END IF;
         
    ELSIF length(x) = 4 THEN --dealing with thousands
        char_count := char_count + handle_LT_twenty(thousands_digit); --thousands digit follows same rules as single digit, "one" thousand
         
        IF hundreds_digit+tens_digit+ones_digit = 0
        THEN
            char_count := char_count + length('thousand'); -- 1000 = "onethousand"
        ELSE
            char_count := char_count + length('thousandand'); --no spaces! 1001 = "onethousandandone"
        END IF;
    END IF;
 
    return char_count;
END;
BEGIN
    FOR i IN 1..1000
    LOOP
        total := total + count_chars(i);
    END LOOP;
     
    dbms_output.put_line(total);
END;
 
 
--output: 21124