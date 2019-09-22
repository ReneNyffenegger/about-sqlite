.mode   column
.header on

select
   datetime('now'           ) now,
   time    ('now', '5 hours') now_5,
   date    ('now', '-4 days') now_min_4d;
--             
-- now                  now_5       now_min_4d
-- -------------------  ----------  ----------
-- 2019-09-22 16:19:34  21:19:34    2019-09-18
