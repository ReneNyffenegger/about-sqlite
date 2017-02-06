create table tq84_texts (
  val text
);

insert into tq84_texts values ('foo, the "bar", and the >baz<');

.mode column
.width 20 20
select val, replace(val, '"', '') from tq84_texts;
--
-- foo, the "bar", and   foo, the bar, and th

select val, replace(val, '>baz<', 'baz') from tq84_texts;
--
-- foo, the "bar", and   foo, the "bar", and 

drop table tq84_texts;
