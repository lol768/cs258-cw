/*select STUDENT_ID, avg(SCORE) from EXAM group by STUDENT_ID, STUDENT_NAME order by avg(SCORE) desc;*/

select STUDENT_ID, STUDENT_NAME
from EXAM natural join STUDENT group by STUDENT_ID, STUDENT_NAME
having avg(score) in (select max(AVG_SCORE) from (select
                  STUDENT_ID,
                  avg(SCORE) as AVG_SCORE
                from EXAM
                group by STUDENT_ID
                order by avg(SCORE) desc));

