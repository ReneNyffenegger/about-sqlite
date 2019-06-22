create table table_abc (col_1, col_2, col_3);

insert into table_abc values ('foo', 'bar', 'baz');
insert into table_abc values (   1 ,   42 ,   20 );

.mode   column
.width  10 10 10
.header on
select * from table_abc;
--
-- col_1       col_2       col_3     
-- ----------  ----------  ----------
-- foo         bar         baz       
-- 1           42          20        
--

select
   typeof(col_1) t_1,
   typeof(col_2) t_2,
   typeof(col_3) t_3
from
   table_abc;
--
-- t_1         t_2         t_3       
-- ----------  ----------  ----------
-- text        text        text      
-- integer     integer     integer   
--
