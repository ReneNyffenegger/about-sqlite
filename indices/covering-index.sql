create table tq84_data (
  col1 text,
  col2 text,
  col3 text,
  col4 text
);

create index tq84_ix_covering on tq84_data(col1, col2, col3);

explain query plan
select col3 from tq84_data
where
  col1 = 'foo' and
  col2 = 'bar';
--
--  0|0|0|SEARCH TABLE tq84_data USING COVERING INDEX tq84_ix_covering (col1=? AND col2=?)

drop table tq84_data;
