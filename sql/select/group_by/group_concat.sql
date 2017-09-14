create table foo (
  grp    text,
  val    text
);

insert into foo values ('A', 'abc');
insert into foo values ('A', 'de');
insert into foo values ('A', 'fghij');

insert into foo values ('B', 'one');
insert into foo values ('B', 'two');

insert into foo values ('C', 'foo');
insert into foo values ('C', 'bar');
insert into foo values ('C', 'baz');

select
  grp,
  group_concat(val)
from
  foo
group by
  grp;
--
--A|abc,de,fghij
--B|one,two
--C|foo,bar,baz
