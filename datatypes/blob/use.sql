create table t (
   c1,
   c2
);

insert into t values (zeroblob(5), x'deadbeef');

.mode column
.width 16 16
.header on
select
   quote(c1) c1_hex,
   quote(c2) c2_hex
from
   t;
--
-- c1_hex            c2_hex          
-- ----------------  ----------------
-- X'0000000000'     X'DEADBEEF'     
--
