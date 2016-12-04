/* harshness ranking */

select avg(score), ORGANISER_NAME from exam inner join HISTORY on EXAM.MODULE_CODE = HISTORY.MODULE_CODE and EXAM.EXAM_YEAR = HISTORY.DELIVERY_YEAR group by ORGANISER_NAME order by avg(score) asc;
