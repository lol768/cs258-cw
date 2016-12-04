select listagg(MODULE_CODE, ' ') within group (order by module_code) Modules from (select MODULE_CODE from module minus (select distinct module_code from exam))
