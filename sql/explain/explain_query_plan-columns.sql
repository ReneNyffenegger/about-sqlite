create table tq84_eqp_A (
  id     integer primary key,
  col1   text,
  col2   text
);

create table tq84_eqp_B (
  id     integer primary key,
  col1   text,
  col2   text
);

create table tq84_eqp_A2B (
  id_A   integer references tq84_eqp_A,
  id_B   integer references tq84_eqp_B,
  col1   text,
  col2   text
);


create index tq84_eqp_A_ix_col2   on tq84_eqp_A  (col2);
create index tq84_eqp_A2B_ix_col1 on tq84_eqp_A2B(col1);

.headers on
.mode column
.width 8 5 4 80
explain query plan
  select
    A.col1,
    A.col2,
    B.col2
  from
    tq84_eqp_A      A                      join
    tq84_eqp_A2B    A2B on A.id = A2B.id_A join
    tq84_eqp_B        B on B.id = A2B.id_B
  where
    A.col2 > 'foo'  and
    B.col1 = 'bar';


drop table tq84_eqp_A2B;
drop table tq84_eqp_A;
drop table tq84_eqp_B;
