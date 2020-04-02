create table tab_one (
   col_1  integer,
   col_2  text,
   col_3  text
);

create table tab_two (
   v1,
   v2
);

create table tab_three (
   c1    integer primary key,
   c2    text
);

create index ix_tab_two on tab_two(v2);
