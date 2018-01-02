DECLARE
divisors_array euler_pkg.int_array := euler_pkg.int_array();
sumz INTEGER := 0;
upper_limit INTEGER := 10000;
BEGIN
 FOR i IN 1..upper_limit LOOP
  sumz := 0;
  divisors_array := euler_pkg.get_divisors(i);
     
      for e in 1 .. divisors_array.count
      loop
        IF divisors_array(e) != i THEN
            sumz := divisors_array(e) + sumz;
        END IF;
      end loop;
   
  INSERT INTO amicable_numbers 
  VALUES (i, sumz);
   
  COMMIT;
  END LOOP;
END;
 
SELECT sum(sum_divisors) 
FROM amicable_numbers a
WHERE EXISTS (SELECT 1 FROM amicable_numbers WHERE sum_divisors = a.number_in AND a.sum_divisors = number_in)
AND number_in != sum_divisors;
 
--output 31626