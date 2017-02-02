--
--  Inspired by http://stackoverflow.com/a/38821165/180275
--

with recursive fib (n1, n2) as (
     select
        1,
        1
   union all
     select
       n2,
       n1+n2
     from
       fib
     limit 50
)
select
  printf("%11d", n1)
--group_concat(n1)
from
  fib;
