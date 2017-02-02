--
--  $ rm -f vacuum.db ; sqlite3 vacuum.db < vacuum.sql

create table foo (
   t text 
);

insert into foo
with recursive rec (t_) as
  (
      select '*'
    union all
      select
        t_ || t_
      from
        rec
      limit 22
  )
select
  t_
from
  rec;


-- select length(t) from foo;

.shell ls -sh vacuum.db
--
-- 4.1M vacuum.db


drop table foo;

.shell ls -sh vacuum.db
--
-- 4.1M vacuum.db

vacuum;

.shell ls -sh vacuum.db
--
-- 4.0K vacuum.db
