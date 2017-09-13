create table tq84_coalesce(
  col_1  text,
  col_2  text,
  col_3  text
);

insert into tq84_coalesce values ( null , null, 'null null');
insert into tq84_coalesce values ('ABC' , null, 'abc  null');
insert into tq84_coalesce values ( null ,'DEF', 'null def' );
insert into tq84_coalesce values ('GHI' ,'JKL', 'ghi  jkl' );

.mode column
.width 5 10
select
  coalesce(col_1, col_2) col,
  col_3
from
  tq84_coalesce;
