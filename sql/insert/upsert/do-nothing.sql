create table T (
   id   integer primary key,
   val  text
);

insert into T values (1, 'one'  ) on conflict do nothing;
insert into T values (2, 'two'  ) on conflict do nothing;
insert into T values (3, 'trhee') on conflict do nothing; -- Note the typo!
insert into T values (3, 'three') on conflict do nothing;

select * from T;
--
--  1|one
--  2|two
--  3|three
