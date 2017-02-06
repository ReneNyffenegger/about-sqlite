create table tq84_upper (
  id   int primary key,
  val  text
);

insert into tq84_upper values (1, 'One'  );
insert into tq84_upper values (2, 'Two'  );
insert into tq84_upper values (3, 'Three');

select * from tq84_upper where       val = 'two';

select * from tq84_upper where upper(val) = 'TWO';
--
-- 2|Two

select id, upper(val) from tq84_upper;
-- 
-- 1|ONE
-- 2|TWO
-- 3|THREE

drop table tq84_upper;
