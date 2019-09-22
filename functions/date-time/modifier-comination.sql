.mode   column
.header on

select
    datetime('now',
             'start of day',
             '+3 hours',
             '+12 minutes') "3 hours, 12 minuts past midnight";
--
-- 3 hours, 12 minuts past midnight
-- --------------------------------
-- 2019-09-22 03:12:00             
