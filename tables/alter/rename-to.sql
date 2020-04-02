create table tq84_orig (
  col_1 primary key,
  col_2   not null,
  col_3   not null,
  col_4,
  --
  unique(col_2, col_3)
);

begin transaction;

insert into tq84_orig values (1, 'abc', 'def', 'ghi');
insert into tq84_orig values (2, 'jkl', 'mno',  null);

commit transaction;

alter table tq84_orig rename to tq84_renamed;

.tables
--
-- tq84_renamed

.schema tq84_renamed
--
-- CREATE TABLE "tq84_renamed" (
--   col_1 primary key,
--   col_2   not null,
--   col_3   not null,
--   col_4,
--   --
--   unique(col_2, col_3)
-- );

select * from tq84_renamed;
--
--1|abc|def|ghi
--2|jkl|mno|

drop table tq84_renamed;
