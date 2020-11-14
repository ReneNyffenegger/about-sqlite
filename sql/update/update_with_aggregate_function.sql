--
-- Compare with ../replace/replace_with_aggregate_function.sql
--
-- See also http://stackoverflow.com/questions/34960972
--
drop table if exists tq84_child;
drop table if exists tq84_parent;

create table tq84_parent (
  id                text primary key,
  avg_val           float,
  min_val           float,
  max_val           float
);

create table tq84_child (
  id_parent         text references tq84_parent,
  val               int
);


insert into tq84_parent (id) values('A');
insert into tq84_parent (id) values('B');

insert into tq84_child values ('A',  1);
insert into tq84_child values ('A',  2);
insert into tq84_child values ('A',  3);

insert into tq84_child values ('B',  6);
insert into tq84_child values ('B',  7);
insert into tq84_child values ('B',  8);
insert into tq84_child values ('B',  9);
insert into tq84_child values ('B', 10);

update
  tq84_parent
set
 (
  avg_val,
  min_val,
  max_val
 )
= (select
     avg(val),
     min(val),
     max(val)
   from
     tq84_child
   where
     id_parent = id
);

.mode columns

select * from tq84_parent;
--
--  id  avg_val  min_val  max_val
--  --  -------  -------  -------
--  A   2.0      1.0      3.0
--  B   8.0      6.0      10.0
