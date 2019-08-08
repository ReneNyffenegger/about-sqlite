create table t (
   c1,
   c2
);

insert into t values (zeroblob(5), x'deadbeef');

.mode column
.width 16 16
.header on
select
   hex  (c1) c1_hex  ,
   hex  (c2) c2_hex  ,
   quote(c1) c1_quote,
   quote(c2) c2_quote
from
   t;
--
-- c1_hex            c2_hex            c1_quote       c2_quote
-- ----------------  ----------------  -------------  -----------
-- 0000000000        DEADBEEF          X'0000000000'  X'DEADBEEF'
