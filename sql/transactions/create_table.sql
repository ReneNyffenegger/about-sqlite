--
-- Unlike Oracle, the effect of  "create table" statement
-- can be rolled back.
--
create table table_one (a);

begin transaction;
  create table table_two(b);
  create table table_three(b);
rollback;

.tables
--
-- table_one

drop table table_one;
