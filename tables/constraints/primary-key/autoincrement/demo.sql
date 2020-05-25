create table tq84_pk_autoincr (
  id     integer primary key, -- autoincrement,
  val_1,
  val_2
);

--
-- Explicitely setting the value of the primary key
-- to null causes the primary key (that is: the rowid)
-- to be auto-incremented.
--
insert into tq84_pk_autoincr values(null, 'foo', 'bar');
insert into tq84_pk_autoincr values(null, 'baz', 'qux');

--
-- Same thing if the primary key column is ommited in
-- the insert statement.
--
insert into tq84_pk_autoincr(val_1, val_2) values ('one'  , 'two' );
insert into tq84_pk_autoincr(val_1, val_2) values ('three', 'four');

--
-- If the primary key is set to a value, it resets the
-- auto increment value:
--
insert into tq84_pk_autoincr values (  41, 'hello' , 'world');
insert into tq84_pk_autoincr values (null, 'twenty', 'two');

.header on
.mode   column
.width 2 7 7
select * from tq84_pk_autoincr;
-- id  val_1    val_2  
-- --  -------  -------
-- 1   foo      bar    
-- 2   baz      qux    
-- 3   one      two    
-- 4   three    four   
-- 41  hello    world  
-- 42  twenty   two    
