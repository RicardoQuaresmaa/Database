DECLARE
    answer NUMBER := 0;
    i INTEGER := 0;
 
    CURSOR name_cur
    IS
        SELECT rownum as num, name
        FROM names
        order by name;
 
    FUNCTION get_name_sum(name_in VARCHAR2) return NUMBER
    IS
        sumz NUMBER := 0;
    BEGIN
        for i IN 1..length(name_in) loop
            sumz := sumz + ascii(substr(name_in,i,1))-64;
        end loop;
         
        return sumz;
    END;
BEGIN
 
    for name_rec in name_cur loop
     i := i+1;
     answer := answer + (get_name_sum(name_rec.name) * i);
    end loop;
     
    dbms_output.put_line(answer);
END;
 
--output 871198282