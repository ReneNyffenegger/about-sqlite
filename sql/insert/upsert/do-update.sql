create table T (
   id   integer primary key,
   val  text
);

insert into T values (1, 'one'  ) on conflict(id) do update set val=excluded.val;
insert into T values (2, 'two'  ) on conflict(id) do update set val=excluded.val;
insert into T values (3, 'trhee') on conflict(id) do update set val=excluded.val; -- Note the typo
insert into T values (3, 'three') on conflict(id) do update set val=excluded.val;

select * from T;
--
--  1|one
--  2|two
--  3|three
