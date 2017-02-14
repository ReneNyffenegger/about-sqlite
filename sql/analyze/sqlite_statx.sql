create table tq84_table (
  id integer primary key
);

with num_generator(n) as (
     select 1 n union all
     select 1+n from num_generator
     limit  1000
)
insert into tq84_table
select n from num_generator;

analyze tq84_table;

select
  idx,
  stat
from
  sqlite_stat1
where
  tbl = 'tq84_table';


--
--   Table sqlite_stat3 only available if
--   compiled with SQLITE_ENABLE_STAT3 and
--   without SQLITE_ENABLE_STAT4
--
select * from sqlite_stat3;

--
--   Table sqlite_stat4 only available if
--   compiled with SQLITE_ENABLE_STAT4 and
select * from sqlite_stat4;

drop table tq84_table;
