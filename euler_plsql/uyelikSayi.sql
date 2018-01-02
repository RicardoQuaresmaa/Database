
  SELECT TO_DATE (record_Date), COUNT (*)
    FROM members
   WHERE record_Date >
            TO_DATE ('27-JAN-2017 11:11:00', 'DD-MM-YYYY HH24:MI:SS')
GROUP BY TO_DATE (record_Date)
ORDER BY TO_DATE (record_Date);