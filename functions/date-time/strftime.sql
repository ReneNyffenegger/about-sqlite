
select datetime('now');
-- 2017-01-17 11:10:56

select strftime('%H:%M:%S %d.%m.%Y', 'now');
-- 11:10:56 17.01.2017

select strftime('%s', '1970-01-01 00:00:00');
-- 0

select strftime('%s', '1970-01-01 00:00:01');
-- 1

select strftime('%s', '2016-09-17 22:34:18');
-- 1474151658

select datetime(1474151658, 'unixepoch');
-- 2016-09-17 22:34:18
