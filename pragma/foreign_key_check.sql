create table tab_p (
  id   integer primary key
);

create table tab_c (
  ref  integer references tab_p
);

insert into tab_p values (42);

insert into tab_c values (10);
insert into tab_c values (42);
insert into tab_c values (99);

-- Check the entire database
pragma foreign_key_check;
--
-- tab_c|1|tab_p|0
-- tab_c|3|tab_p|0
--

-- Check one table only:
pragma foreign_key_check('tab_c');
--
-- tab_c|1|tab_p|0
-- tab_c|3|tab_p|0
--
