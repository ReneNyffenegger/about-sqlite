create table tab (
  col_txt_default    text,
  col_txt_binary     text   collate binary,
  col_txt_nocase     text   collate nocase
);

insert into tab values ('foo', 'foo', 'foo');
insert into tab values ('Foo', 'Foo', 'Foo');
insert into tab values ('FOO', 'FOO', 'FOO');

.print --
select * from tab where col_txt_default = 'Foo';
-- 
-- Foo|Foo|Foo

.print --
select * from tab where col_txt_binary  = 'Foo';
-- 
-- Foo|Foo|Foo

.print --
select * from tab where col_txt_nocase  = 'Foo';
-- 
-- foo|foo|foo
-- Foo|Foo|Foo
-- FOO|FOO|FOO
