select STUDENT_ID, LISTAGG(MODULE_CODE, ' ') within group (order by EXAM_YEAR) modules from EXAM group by STUDENT_ID
