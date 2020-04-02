create table tq84_table (
  num  integer,
  lang text   ,
  word text   ,
  --
  constraint tq84_table_pk primary key (num, lang)
);

insert into tq84_table values(1, 'en', 'one' );
insert into tq84_table values(1, 'de', 'eins');
insert into tq84_table values(2, 'en', 'two' );
insert into tq84_table values(2, 'fr', 'deux');
