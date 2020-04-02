create table tq84_pk (
  col_1 text primary key,
  col_2 text
);

insert into tq84_pk values ('foo', 'bar');
insert into tq84_pk values ('baz',  null);

select
  rowid,
  col_1,
  col_2
from
  tq84_pk;

drop table tq84_pk;
