create table t (v);

insert into t values (  42        );
insert into t values ( '42'       );
insert into t values ( '4'        );
insert into t values ( '51'       );
insert into t values (  51        );
insert into t values (  5         );
insert into t values (  null      );
insert into t values (  5.5       );
insert into t values (  6         );
insert into t values ( zeroblob(2));
insert into t values ( zeroblob(1));
insert into t values (x'42'       );
insert into t values (x'51'       );

.mode column
.header on
.width  10 10
select
   typeof(v) tp,
   quote(v)  tq
from
   t
order by
   v;
--
--  tp          tq        
--  ----------  ----------
--  null        NULL      
--  integer     5         
--  real        5.5       
--  integer     6         
--  integer     42        
--  integer     51        
--  text        '4'       
--  text        '42'      
--  text        '51'      
--  blob        X'00'     
--  blob        X'0000'   
--  blob        X'42'     
--  blob        X'51'     
