--
-- Compare with ../replace/replace_with_aggregate_function.sql
--
-- See also http://stackoverflow.com/questions/34960972
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

--
-- Does not work
--
-- update
--   tq84_parent
-- set
--  (
--   avg_val,
--   min_val,
--   max_val
--  )
-- = (select
--      avg(val),
--      min(val),
--      max(val)
--    from
--      tq84_child
--    where
--      id_parent = id
-- );

update 
  tq84_parent
set
  avg_val = (select avg(val) from tq84_child where id_parent = id),
  min_val = (select min(val) from tq84_child where id_parent = id),
  max_val = (select max(val) from tq84_child where id_parent = id);




.mode columns

select * from tq84_parent;


 
