create table T (p integer primary key              , d);
create table U (p integer primary key autoincrement, d);

insert into T (d) values ('first');
insert into U (d) values ('first');

insert into T (d) values ('second');
insert into U (d) values ('second');

delete from T where d = 'second';
delete from U where d = 'second';

insert into T (d) values ('third');
insert into U (d) values ('third');

.mode  column
.width 2 10

select * from T;
--
--  1   first
--  2   third

select * from U;
--
--  1   first
--  3   third
