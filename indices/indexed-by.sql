create table tq84_tab (
  id   number primary key,
  col  text
);

explain query plan
  select *
  from tq84_tab
  where
    id  =  42 and
    col = 'val';
--
-- 0|0|0|SEARCH TABLE tq84_tab USING INDEX sqlite_autoindex_tq84_tab_1 (id=?)
--

create index tq84_tab_ix_col on tq84_tab (col); 

explain query plan
  select *
  from tq84_tab
  where
    id  =  42 and
    col = 'val';
-- 
-- 0|0|0|SEARCH TABLE tq84_tab USING INDEX sqlite_autoindex_tq84_tab_1 (id=?)
-- 

explain query plan
  select *
  from tq84_tab INDEXED BY tq84_tab_ix_col
  where
    id  =  42 and
    col = 'val';
-- 
-- 0|0|0|SEARCH TABLE tq84_tab USING INDEX tq84_tab_ix_col (col=?)
-- 
