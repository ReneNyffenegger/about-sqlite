create table tq84_1000_records (
  id integer primary key
);

with num_generator(n) as (
     select 1 n union all
     select 1+n from num_generator
     limit  1000
)
insert into tq84_1000_records
select n from num_generator;

select count(*) from tq84_1000_records;
--
-- 1000

drop table tq84_1000_records;
