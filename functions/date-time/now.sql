.mode   column
.header on

select
   time    (                             'now') "time",
   date    (                             'now') "date",
   datetime(                             'now') "datetime",
   strftime('Minutes past the hour: %M', 'now') "strftime";
--
-- time        date        datetime             strftime                 
-- ----------  ----------  -------------------  -------------------------
-- 15:32:24    2019-09-22  2019-09-22 15:32:24  Minutes past the hour: 32
