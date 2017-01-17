-- sqlite3 < date.sql

select date('now');
-- 2017-01-17

select date('now', '3 Hours');
-- 2017-01-17

select date('now', '10 Days');
-- 2017-01-27

select date('now', '4 Months');
-- 2017-05-17

select date('now', 'start of year');
-- 2017-01-01

select date('now', '5 Months', 'start of month');
-- 2017-06-01

select date('now', 'weekday 0');
-- 2017-01-22

select date('now', 'weekday 1');
-- 2017-01-23

select date(0, 'unixepoch');
-- 1970-01-01

select date(365*24*60*60, 'unixepoch');
-- 1971-01-01

select date('2016-05-17', '-18 Days');
-- 2016-04-29

.quit
