create table tq84_tab (
  col1,
  col2
);

create view tq84_vw as
select
  col_one,
  col_two
from
  tq84_tab;

select * from tq84_vw;
--
-- Error: … no such column: col_one

drop view tq84_vw;
drop table tq84_tab;
