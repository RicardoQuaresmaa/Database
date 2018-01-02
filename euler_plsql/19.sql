DECLARE
day_of_week INTEGER := 2; --1901 starts on a Tuesday
answer INTEGER := 0;
FUNCTION first_day_of_month(month_days_in INTEGER, curr_day_in INTEGER) RETURN INTEGER
AS
    day_tracker INTEGER;
BEGIN
--takes weekday of the first of the previous month and return
--what the first of the next month will be
-- 1 = Mon, 2 = Tues, 3 = Wed, 4 = Thurs, 5 = Fri, 6 = Sat, 7 = Sun
 
   day_tracker := curr_day_in + MOD(month_days_in, 7);
    
   IF day_tracker > 7 THEN
    day_tracker := day_tracker - 7;
   END IF;
    
   RETURN day_tracker;
END;
BEGIN
    FOR i_year IN 1901..2000 LOOP
        FOR i_month IN 1..12 LOOP
            --check if it's Sunday at the start of each month
            IF day_of_week = 7 THEN
                    answer := answer + 1;
            END IF;
                 
            --calculate what day of the week if will be at the start of next month
            IF i_month IN (4,6,9,11) THEN
                --thirty days            
                day_of_week := first_day_of_month(30, day_of_week);
            ELSIF i_month IN (2) THEN
                --feb 28/29            
                IF (REMAINDER(i_year,4) = 0 AND REMAINDER(i_year,100) != 0) OR REMAINDER(i_year, 400) = 0 THEN
                    --leap year
                    day_of_week := first_day_of_month(29, day_of_week);
                ELSE
                    day_of_week := first_day_of_month(28, day_of_week);
                END IF;
            ELSE
                --thirty-one days            
                day_of_week := first_day_of_month(31, day_of_week);
            END IF;
        END LOOP;
    END LOOP;
dbms_output.put_line(answer);
END;
 
--output: 171





DECLARE
answer INTEGER := 0;
BEGIN
    FOR i_year IN 1901..2000 LOOP
        FOR i_month IN 1..12 LOOP
            --check if it's Sunday at the start of each month
           IF TRIM(TO_CHAR(TO_DATE(i_month||'/1/'||i_year,'MM/DD/YYYY'), 'DAY')) = 'SUNDAY' THEN
                answer := answer + 1;
           END IF;            
        END LOOP;
    END LOOP;
dbms_output.put_line(answer);
END;