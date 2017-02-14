create table tq84_p (
  id  integer primary key,
  col text
);

create table tq84_c (
  id_p integer references tq84_c,
  col  text
);

explain query plan
select
  p.col  p_col,
  c.col  c_col
from
  tq84_p p   join
  tq84_c c on p.id = c.id_p;
--
-- 0|0|1|SCAN TABLE tq84_c AS c
-- 0|1|0|SEARCH TABLE tq84_p AS p USING INTEGER PRIMARY KEY (rowid=?)


explain
select
  p.col  p_col,
  c.col  c_col
from
  tq84_p p   join
  tq84_c c on p.id = c.id_p;
--
--addr  opcode         p1    p2    p3    p4             p5  comment      
------  -------------  ----  ----  ----  -------------  --  -------------
--0     Init           0     14    0                    00  Start at 14  
--1     OpenRead       1     3     0     2              00  root=3 iDb=0; tq84_c
--2     OpenRead       0     2     0     2              00  root=2 iDb=0; tq84_p
--3     Rewind         1     11    0                    00               
--4       Column         1     0     1                    00  r[1]=tq84_c.id_p
--5       MustBeInt      1     10    0                    00               
--6       NotExists      0     10    1                    00  intkey=r[1]; pk
--7       Column         0     1     2                    00  r[2]=tq84_p.col
--8       Column         1     1     3                    00  r[3]=tq84_c.col
--9       ResultRow      2     2     0                    00  output=r[2..3]
--10    Next           1     4     0                    01               
--11    Close          1     0     0                    00               
--12    Close          0     0     0                    00               
--13    Halt           0     0     0                    00               
--14    Transaction    0     0     6     0              01  usesStmtJournal=0
--15    TableLock      0     3     0     tq84_c         00  iDb=0 root=3 write=0
--16    TableLock      0     2     0     tq84_p         00  iDb=0 root=2 write=0
--17    Goto           0     1     0                    00               

drop table tq84_c;
drop table tq84_p;
