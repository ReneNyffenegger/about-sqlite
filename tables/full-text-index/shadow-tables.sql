create virtual table tq84_tab
using fts4 (
  col_1 text,
  col_2 text,
  col_3 text
);

select
  name
from
  sqlite_master
where
  type = 'table'          and
  name like '%tq84_tab%'  and
  name !=    'tq84_tab';
--
--tq84_tab_content
--tq84_tab_segments
--tq84_tab_segdir
--tq84_tab_docsize
--tq84_tab_stat

.schema tq84_tab_content
--
-- CREATE TABLE 'tq84_tab_content'(docid INTEGER PRIMARY KEY, 'c0col_1', 'c1col_2', 'c2col_3');

.schema tq84_tab_segments
--
-- CREATE TABLE 'tq84_tab_segments'(blockid INTEGER PRIMARY KEY, block BLOB);

.schema tq84_tab_segdir
--
-- CREATE TABLE 'tq84_tab_segdir'(level INTEGER,idx INTEGER,start_block INTEGER,leaves_end_block INTEGER,end_block INTEGER,root BLOB,PRIMARY KEY(level, idx)); 

.schema tq84_tab_docsize
--
-- CREATE TABLE 'tq84_tab_docsize'(docid INTEGER PRIMARY KEY, size BLOB);

.schema tq84_tab_stat
--
-- CREATE TABLE 'tq84_tab_stat'(id INTEGER PRIMARY KEY, value BLOB);


drop table tq84_tab;
