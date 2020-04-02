create table foo (
  id,
  col_1,
  col_2  text,
  col_3  check (col_3 > 5 and col_3 < 10),
  --
  constraint foo_pk primary key (id),
  constraint foo_uq unique(col_2, col_3)
);

create index foo_ix on foo (col_2);

create view foo_v as
select
  col_1,
  col_3,
  col_1 + col_2 sum_col
from
  foo;


select type, name from sqlite_master where tbl_name = 'foo';
--
-- table|foo
-- index|sqlite_autoindex_foo_1
-- index|sqlite_autoindex_foo_2
-- index|foo_ix


select type, name from sqlite_master where tbl_name = 'foo_v';
--
-- view|foo_v


select sql from sqlite_master where name = 'foo';
--
-- CREATE TABLE foo (
--   id,
--   col_1,
--   col_2  text,
--   col_3  check (col_3 > 5 and col_3 < 10),
--   --
--   constraint foo_pk primary key (id),
--   constraint foo_uq unique(col_2, col_3)
-- )

  

select name, type from sqlite_master where sql is not null;
-- 
-- foo|table
-- foo_ix|index
-- foo_v|view

drop table foo;
