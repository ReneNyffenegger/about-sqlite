.mode   column
.header on

select
   date('2019-09-20', 'weekday 0') next_sunday,
   date('2019-09-20', 'weekday 1') next_monday,
   date('2019-09-20', 'weekday 2') next_tuesday,
   date('2019-09-20', 'weekday 3') next_wednesday,
   date('2019-09-20', 'weekday 4') next_thursday,
   date('2019-09-20', 'weekday 5') next_friday,
   date('2019-09-20', 'weekday 6') next_saturday;
--
-- next_sunday  next_monday  next_tuesday  next_wednesday  next_thursday  next_friday  next_saturday
-- -----------  -----------  ------------  --------------  -------------  -----------  -------------
-- 2019-09-22   2019-09-23   2019-09-24    2019-09-25      2019-09-26     2019-09-20   2019-09-21   
