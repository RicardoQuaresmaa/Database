DECLARE
TYPE grid IS VARRAY(20) OF VARCHAR2(40);
num_grid grid := grid();
answer NUMERIC := 0;
product NUMERIC;
    FUNCTION get_num(line_in VARCHAR2, num_in INTEGER) 
    RETURN VARCHAR2
    AS
    numz NUMERIC;
    BEGIN
        numz := num_in * 2 - 1;
        RETURN substr(line_in, numz, 2);
    END;
BEGIN
num_grid.EXTEND(20);
num_grid(1) := '0802229738150040007504050778521250779108';
num_grid(2) := '4949994017811857608717409843694804566200';
num_grid(3) := '8149317355791429937140675388300349133665';
num_grid(4) := '5270952304601142692468560132567137023691';
num_grid(5) := '2231167151676389419236542240402866331380';
num_grid(6) := '2447326099034502447533537836842035171250';
num_grid(7) := '3298812864236710263840675954706618386470';
num_grid(8) := '6726206802621220956394396308409166499421';
num_grid(9) := '2455580566739926971778789683148834896372';
num_grid(10) := '2136230975007644204535140061339734313395';
num_grid(11) := '7817532822753167159403800462161409535692';
num_grid(12) := '1639054296353147555888240017542436298557';
num_grid(13) := '8656004835718907054444374460215851541758';
num_grid(14) := '1980816805944769287392138652177704895540';
num_grid(15) := '0452088397359916079757321626267933279866';
num_grid(16) := '8836688757622072034633674655123263935369';
num_grid(17) := '0442167338253911249472180846293240627636';
num_grid(18) := '2069364172302388346299698267598574043616';
num_grid(19) := '2073352978319001743149714886811623570554';
num_grid(20) := '0170547183515469169233486143520189196748';
 
FOR i IN 1..num_grid.count LOOP --for each line
    FOR n IN 1..20 LOOP --for each individual number
        IF i < 17 THEN
            --handles the up/down cases
            product := get_num(num_grid(i),n) * get_num(num_grid(i+1),n) * get_num(num_grid(i+2),n) * get_num(num_grid(i+3),n);
             
            IF product > answer
            THEN
                answer := product;
            END IF;
             
            --handles diagnol left-to-right
            product := get_num(num_grid(i),n) * get_num(num_grid(i+1),n+1) * get_num(num_grid(i+2),n+2) * get_num(num_grid(i+3),n+3);
             
            IF product > answer
            THEN
                answer := product;
            END IF;
             
            IF n > 3
            THEN
                 --handles diagnol right-to-left
                product := get_num(num_grid(i),n) * get_num(num_grid(i+1),n-1) * get_num(num_grid(i+2),n-2) * get_num(num_grid(i+3),n-3);
                 
                IF product > answer
                THEN
                    answer := product;
                END IF;
            END IF;
        END IF;  
           
        IF n <17 THEN
            --handles left/right cases
            product := get_num(num_grid(i),n) * get_num(num_grid(i),n+1) * get_num(num_grid(i),n+2) * get_num(num_grid(i),n+3);
            --dbms_output.put_line(product);
             
            IF product > answer
            THEN
                answer := product;
            END IF;
        END IF;
    END LOOP;    
END LOOP;
dbms_output.put_line(answer);
END;
--output: 70600674