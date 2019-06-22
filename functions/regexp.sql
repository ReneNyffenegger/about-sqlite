create table tq84_regexp (
  col text
);

insert into tq84_regexp values ('foo');
insert into tq84_regexp values ('twenty-two: 42');

--
-- pcre.so: needed for regexp--
--
.load /usr/lib/sqlite3/pcre.so

select col from tq84_regexp where col regexp '\d';
--
-- twenty-two: 42

select col from tq84_regexp where col regexp '(.)\1';
--
-- foo

drop table tq84_regexp;
