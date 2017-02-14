with num_generator(n) as (
  select 0 n union all
  select 1+n from num_generator
  limit 15
)
select
  n,
  n % 7 n_mod_7
from
  num_generator;
-- 
-- 0|0
-- 1|1
-- 2|2
-- 3|3
-- 4|4
-- 5|5
-- 6|6
-- 7|0
-- 8|1
-- 9|2
-- 10|3
-- 11|4
-- 12|5
-- 13|6
-- 14|0
