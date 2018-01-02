DECLARE
TYPE triangle_array IS VARRAY(20) OF VARCHAR2(60);
triangle triangle_array := triangle_array();
new_num INTEGER;
max_adjac_num INTEGER;
BEGIN
triangle.EXTEND(15);
triangle(1) := '75';
triangle(2) := '95 64';
triangle(3) := '17 47 82';
triangle(4) := '18 35 87 10';
triangle(5) := '20 04 82 47 65';
triangle(6) := '19 01 23 75 03 34';
triangle(7) := '88 02 77 73 07 63 67';
triangle(8) := '99 65 04 28 06 16 70 92';
triangle(9) := '41 41 26 56 83 40 80 70 33';
triangle(10) := '41 48 72 33 47 32 37 16 94 29';
triangle(11) := '53 71 44 65 25 43 91 52 97 51 14';
triangle(12) := '70 11 33 28 77 73 17 78 39 68 17 57';
triangle(13) := '91 71 52 38 17 14 91 43 58 50 27 29 48';
triangle(14) := '63 66 04 68 89 53 67 30 73 16 69 87 40 31';
triangle(15) := '04 62 98 27 23 09 70 98 73 93 38 53 60 04 23';
  
FOR i IN REVERSE 1..triangle.count-1 LOOP --starting at the 2nd to bottom line
    FOR x IN 1..REGEXP_COUNT(triangle(i),' ')+1 LOOP
 
      --get the max value of the two numbers below current number in the triangle
      SELECT MAX(column_value)
      INTO max_adjac_num 
      FROM table(sys.odcinumberlist(EULER_PKG.get_num_from_list(triangle(i+1),x),EULER_PKG.get_num_from_list(triangle(i+1),x+1)));
       
      new_num := EULER_PKG.get_num_from_list(triangle(i),x) + max_adjac_num;
       
      EULER_PKG.set_num_from_list(triangle(i), x,new_num);
       
    END LOOP;
     
    dbms_output.put_line(triangle(i));
     
END LOOP;
END;
 
 
/*output:
125 164 102 95 112 123 165 128 166 109 122 147 100 54
255 235 154 150 140 179 256 209 224 172 174 176 148
325 246 187 178 256 329 273 302 263 242 193 233
378 317 231 321 354 372 393 354 360 293 247
419 365 393 387 419 425 430 376 454 322
460 434 419 475 508 470 510 524 487
559 499 479 536 514 526 594 616
647 501 613 609 533 657 683
666 614 636 684 660 717
686 640 766 731 782
704 801 853 792
818 900 935
995 999
1074 */


/*
Function

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

*/