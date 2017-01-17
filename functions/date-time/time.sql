select time('now');
-- 11:04:59

select time('now', 'utc');
-- 10:04:59

select time('now', 'localtime');
-- 12:04:59

select time('now', 'unixepoch');
-- 10:42:50

select time('now', 'start of day', '3 Hours');
-- 03:00:00
