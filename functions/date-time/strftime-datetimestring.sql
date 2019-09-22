.mode   column
.header on

select
   strftime('%d/%m/%Y', '2018-03-05') british,
   strftime('%m/%d/%Y', '2018-03-05') american,
   strftime('%d.%m.%Y', '2018-03-05') swiss
;
--
-- british     american    swiss     
-- ----------  ----------  ----------
-- 05/03/2018  03/05/2018  05.03.2018
