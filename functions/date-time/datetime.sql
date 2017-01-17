
select datetime('now');
-- 2017-01-17 11:06:21

select datetime('now', '5 Hours');
-- 2017-01-17 16:06:21

select datetime('now', '-3 Hours');
-- 2017-01-17 08:06:21

select datetime(0, 'unixepoch');
-- 1970-01-01 00:00:00

-- 11 Leap years between 1970 and 2016
select datetime((46*365 + 11) * 24*60*60, 'unixepoch');
-- 2016-01-01 00:00:00

select datetime((46*365 + 11) * 24*60*60 + 17*60*60 + 51*60 + 13, 'unixepoch');
-- 2016-01-01 17:51:13
