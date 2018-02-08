create table tq84_pk_autoincr (
  id     integer primary key autoincrement,
  val_1,
  val_2
);

insert into tq84_pk_autoincr values(null, 'foo', 'bar');
insert into tq84_pk_autoincr values(null, 'baz', 'qux');

insert into tq84_pk_autoincr(val_1, val_2) values ('one'  , 'two' );
insert into tq84_pk_autoincr(val_1, val_2) values ('three', 'four');

insert into tq84_pk_autoincr values (  41, 'hello' , 'world');
insert into tq84_pk_autoincr values (null, 'twenty', 'two');

select * from tq84_pk_autoincr;
-- 
-- 1|foo|bar
-- 2|baz|qux
-- 3|one|two
-- 4|three|four
-- 41|hello|world
-- 42|twenty|two
