--
--  Compare with ../update/update_with_aggregate_function.sql
--

drop table if exists tq84_child;
drop table if exists tq84_parent;

create table tq84_parent (
  id                int primary key,
  avg_val           float,
  min_val           float,
  max_val           float
);

create table tq84_child (
  id_parent         int references tq84_parent,
  val               int
);


insert into tq84_parent (id) values(1);
insert into tq84_parent (id) values(2);

insert into tq84_child values (1,  1);
insert into tq84_child values (1,  2);
insert into tq84_child values (1,  3);

insert into tq84_child values (2,  6);
insert into tq84_child values (2,  7);
insert into tq84_child values (2,  8);
insert into tq84_child values (2,  9);
insert into tq84_child values (2, 10);

replace into tq84_parent (
  id,
  avg_val,
  min_val,
  max_val
)
select
  id_parent,
  avg(val),
  min(val),
  max(val)
from
  tq84_child
group by
  id_parent;


.mode columns

select * from tq84_parent;
