create table T (
   id  text   primary key,
   val number
);

create table U (
   id_t  text references T,
   diff  number
);

insert into T values ('A',  100);
insert into T values ('B',  200);

insert into U values ('A',  2);
insert into U values ('A',  3);
insert into U values ('A',  4);

insert into U values ('B',  5);
insert into U values ('B',  6);

update T
set
   val = val - total.diff
from
   (select
       id_t,
       sum(diff) as diff
    from
       U
    group by
       id_t
    )       as total
where
   T.id = total.id_t;

.mode columns
select * from T;
--
--  id  val
--  --  ---
--  A   91
--  B   189
