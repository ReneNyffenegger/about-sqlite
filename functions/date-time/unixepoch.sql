.mode column
.header    on

select
   datetime(0, 'unixepoch') start_of_unix_epoch,
   datetime( (2019 - 1970) * 365 * 24 * 60 * 60 +
                              12 * 24 * 60 * 60 +  -- 12 Leap years
                               7 * 24 * 60 * 60 +  --  8th day of the year (epoch starts with first!)
                                   15 * 60 * 60 +  --  15th hour
                                        32 * 60 +  --  32th minute
                                              7 ,  --  7 second
                             'unixepoch')  calculated;
;
