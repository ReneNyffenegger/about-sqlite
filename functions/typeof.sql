create table tq84_typeof (col);

insert into tq84_typeof values ( 1   );
insert into tq84_typeof values ( 1.0 );
insert into tq84_typeof values ('1.0');
insert into tq84_typeof values ( null);
insert into tq84_typeof values ( zeroblob(20));

.mode column
.width 10 30
.nullvalue '<null>'

select col, typeof(col) from tq84_typeof;
--
-- 1           integer                       
-- 1.0         real                          
-- 1.0         text                          
-- <null>      null                          
--             blob   

drop table tq84_typeof;
