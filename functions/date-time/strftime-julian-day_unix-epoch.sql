.mode   column
.header on

select
          strftime('%J', '1970-01-01 00:00:00')  JulianDay,
          strftime('%s', '1970-01-01 00:00:00')  UnixEpoch,
   typeof(strftime('%J', '1970-01-01 00:00:00')) dataType;
--
-- JulianDay   UnixEpoch   dataType  
-- ----------  ----------  ----------
-- 2440587.5   0           text      
