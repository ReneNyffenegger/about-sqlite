
select date('now') || ' -> ' || julianday('now', 'start of day');
--
-- 2017-01-17 -> 2457770.5

-- Date arithmetic:
select julianday('2017-08-28') - julianday('2017-07-28');
-- 31.0

select julianday('2017-08-28 06:00:00') - julianday('2017-07-28');
-- 31.25
