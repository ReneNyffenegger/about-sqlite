attach database 'abc.db' as abc;

create table abc.tab(a);
insert into tab values ('attached table');

create table tab(a);
insert   into tab values ('main table');
select * from tab;

create temp table tab(a);
insert into tab values ('temp table');
select * from tab;

drop table tab;
select * from tab;

drop table tab;
select * from tab;

drop table tab;
