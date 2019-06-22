.mode   column
.width  10 10 10 10 10
.header on
select
   typeof( 42         )  i,
   typeof( 99.9       )  r,
   typeof('string'    )  t,
   typeof( null       )  n,
   typeof( x'deadbeef')  b
;
--
-- i           r           t           n           b         
-- ----------  ----------  ----------  ----------  ----------
-- integer     real        text        null        blob      
--
