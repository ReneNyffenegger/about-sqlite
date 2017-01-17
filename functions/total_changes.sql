create table tq84_totalchanges(a, b, c);

insert into tq84_totalchanges values (1, 2, 3);
insert into tq84_totalchanges values (4, 5, 6);
insert into tq84_totalchanges values (7, 8, 9);
delete from tq84_totalchanges where a = 4;

select total_changes();
-- 4

delete from tq84_totalchanges where a = 4;
select total_changes();
-- 4

insert into tq84_totalchanges select a/2, b/2, c/2 from tq84_totalchanges;
select total_changes();
-- 6


drop table tq84_totalchanges;
select total_changes();
-- 6
