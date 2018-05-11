.mode column
.width 2 2 2 2 10

create table tq84_foo (
  id    abcdef primary key,
  col_1 text
);

insert into tq84_foo values (  2, 'two'      );
insert into tq84_foo values (  7, 'seven'    );
insert into tq84_foo values (  5, 'five'     );
insert into tq84_foo values (  9, 'three'    );

update tq84_foo set id = 3 where col_1 = 'three';

select
  rowid,
  oid,       -- alternative name for rowid
  _rowid_,   -- alternative name for rowid
  id,
  col_1
from
  tq84_foo;
--
-- 1   1   1   2   two
-- 2   2   2   7   seven
-- 3   3   3   5   five
-- 4   4   4   3   three

drop table tq84_foo;

--
-- If the primary key of the table is one column of type »integer«, it
-- becomes an alias for the rowid:

create table tq84_foo (
  id    integer primary key,
  col_1 text
);


insert into tq84_foo values (  2, 'two'      );
insert into tq84_foo values (  7, 'seven'    );
insert into tq84_foo values (  5, 'five'     );
insert into tq84_foo values (  9, 'three'    );

update tq84_foo set id = 3 where col_1 = 'three';

select
  rowid,
  oid,
 _rowid_,
  id,
  col_1
from
  tq84_foo;
-- 
-- 2   2   2   2   two
-- 3   3   3   3   three
-- 5   5   5   5   five
-- 7   7   7   7   seven

drop table tq84_foo;
