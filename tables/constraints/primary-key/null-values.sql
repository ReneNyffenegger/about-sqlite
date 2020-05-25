create table T (
  p  text primary key,
  v  text
);

insert into T values ('one'  , 'first' );
insert into T values ('two'  , 'second');
insert into T values ('three', 'third' );
insert into T values ( null  , 'null'  );

.mode  column
.width 5 10

select * from T;
--
-- one    first
-- two    second
-- three  third
--        null
