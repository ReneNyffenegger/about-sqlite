create table tq84_tab (
  id   integer primary key autoincrement,
  col
);

insert into tq84_tab (col) values ('foo');
insert into tq84_tab (col) values ('bar');

select * from sqlite_sequence where name = 'tq84_tab';
--
-- tq84_tab|2

insert into tq84_tab values(5, 'five');

select * from sqlite_sequence where name = 'tq84_tab';
--
-- tq84_tab|5

insert into tq84_tab (col) values ('baz');
select id from tq84_tab where col = 'baz';
--
-- 6

select * from sqlite_sequence where name = 'tq84_tab';
--
-- tq84_tab|6

drop table tq84_tab;
