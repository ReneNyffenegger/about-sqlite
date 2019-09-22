.mode   column
.header on

select
    datetime ('0'                  )                           start_of_julian_day,
    julianday('now', 'start of day')                           todays_julian_day,
    julianday('2017-08-28'         ) - julianday('2017-07-28') days_between,
    julianday('2017-08-28 06:00:00') - julianday('2017-07-28') fractional_days_between;
--
-- start_of_julian_day   todays_julian_day  days_between  fractional_days_between
-- --------------------  -----------------  ------------  -----------------------
-- -4713-11-24 12:00:00  2458748.5          31.0          31.25                  
