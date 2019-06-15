create table tq84_tab (
   id   int primary key,
   val  text
);

insert into tq84_tab values (1, 'foo');
insert into tq84_tab values (2, 'Bar');
insert into tq84_tab values (3, 'BAZ');
insert into tq84_tab values (4, 'äÖé');
insert into tq84_tab values (5, 'üzz');

.mode column
.width 3 3 3 3

select
   id,
   val,
   lower(val) val_l,
   upper(val) val_u
from
   tq84_tab;
--
-- 1    foo  foo  FOO
-- 2    Bar  bar  BAR
-- 3    BAZ  baz  BAZ
-- 4    äÖé  äÖé  äÖé
-- 5    üzz  üzz  üZZ

select * from tq84_tab where val = upper(val);
--
-- 3    BAZ
-- 4    äÖé

select * from tq84_tab where val = lower(val);
--
-- 1    foo
-- 4    äÖé
-- 5    üzz
