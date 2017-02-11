create table if not exists tq84_table (
  col_1 text,
  col_2 int
);

.schema tq84_table
--  
-- CREATE TABLE tq84_table (
--   col_1 text,
--   col_2 int
-- );

create table if not exists tq84_table (
  col_3 date,
  col_4 text,
  col_5 int
);

.schema tq84_table
--  
-- CREATE TABLE tq84_table (
--   col_1 text,
--   col_2 int
-- );


drop table tq84_table;
