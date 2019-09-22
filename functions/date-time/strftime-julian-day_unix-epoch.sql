.mode   column
.header on

select
          strftime ('%J', '1970-01-01 00:00:00')  julDay_J  ,
          julianday(      '1970-01-01 00:00:00')  julDay    ,
          strftime ('%s', '1970-01-01 00:00:00')  unixEpoch ,
   typeof(strftime ('%J', '1970-01-01 00:00:00')) dataType_1,
   typeof(julianday(      '1970-01-01 00:00:00')) dataType_2
--
-- julDay_J    julDay      unixEpoch   dataType_1  dataType_2
-- ----------  ----------  ----------  ----------  ----------
-- 2440587.5   2440587.5   0           text        real      
