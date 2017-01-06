--
-- sqlite does not have a union operator, it has
-- an except operator instead.
--

create table tq84_except_1 (col_1, col_2, col_3);
create table tq84_except_2 (col_1, col_2, col_3);

insert into tq84_except_1 values ('foo', 'bar', 'baz'  );
insert into tq84_except_1 values ('one', 'two', 'three');
insert into tq84_except_1 values ('bla', 'bla', 'bla'  );

insert into tq84_except_2 values ('foo', 'bar', 'baz'  );
insert into tq84_except_2 values ('abc', 'def', 'ghi'  );

.mode column
.width 5 5
select col_1, col_2 from tq84_except_1  EXCEPT
select col_1, col_2 from tq84_except_2;
-- bla    bla
-- one    two

drop table tq84_except_1;
drop table tq84_except_2;
