create table tq84_not_null (
  col_int     int,
  col_int_nn  int not null
);

insert into tq84_not_null values (   1,     5);
insert into tq84_not_null values (null,    42);
insert into tq84_not_null values (   9,    '');
insert into tq84_not_null values (  11, 'abc');

-- not possible, throws
--     NOT NULL constraint failed: tq84_not_null.col_int_nn
--
-- insert into tq84_not_null values (  88,  null);

select * from tq84_not_null;

drop table tq84_not_null;
