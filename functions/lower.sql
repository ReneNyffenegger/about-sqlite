create table tq84_lower (
  id   int primary key,
  val  text
);

insert into tq84_lower values (1, 'One'  );
insert into tq84_lower values (2, 'Two'  );
insert into tq84_lower values (3, 'Three');

select * from tq84_lower where       val = 'two';

select * from tq84_lower where lower(val) = 'two';
--
-- 2|Two

select id, lower(val) from tq84_lower;
-- 
-- 1|one
-- 2|two
-- 3|three

drop table tq84_lower;
