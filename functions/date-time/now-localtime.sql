.mode   column
.header on

select
   time('now')                now_utc,
   time('now', 'localtime')   now_localtime;
--
-- now_utc     now_localtime
-- ----------  -------------
-- 16:02:13    18:02:13     
