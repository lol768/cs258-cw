select count(STUDENT_ID) as count, MODULE_CODE, MODULE_NAME from EXAM natural join MODULE group by MODULE_CODE, MODULE_NAME order by count desc;
