.header on
.mode   column
.width  10 19 19

with now  as (
   select strftime('%s', 'now') as unix_epoch
)
select
   now.unix_epoch                                     unix_epoch,
   datetime(now.unix_epoch, 'unixepoch'             ) UTC,
   datetime(now.unix_epoch, 'unixepoch', 'localtime') localTime
from
   now;
--
-- unix_epoch  UTC                  localTime
-- ----------  -------------------  -------------------
-- 1586506681  2020-04-10 08:18:01  2020-04-10 10:18:01
