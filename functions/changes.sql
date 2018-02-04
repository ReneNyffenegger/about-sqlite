create table tq84_changes(col);

select changes();
-- 0

insert into tq84_changes values (1);
select changes();
-- 1

insert into tq84_changes values (2);
select changes();
-- 1

insert into tq84_changes select * from tq84_changes;
select changes();
-- 2

delete from tq84_changes where col=1;
select changes();
-- 2
