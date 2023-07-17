create table T (
   def          , -- default affinity
   txt   text   ,
   int   integer,
   num   numeric,
   blb   blob   ,
   flt   real
);

with v as (
   select   1     v union all
   select  '2'    v union all
   select   3.3   v union all
   select  '4.4'  v union all
   select  '5.'   v union all
   select  'text' v union all
   select  '007'  v union all
   select   null  v
)
insert into T
select
   v.v , v.v , v.v , v.v , v.v , v.v
from
   V;


.mode   column
.header on
.width  4 7 7 7 7 7

select
   def,
   typeof(def) t_def,
   typeof(int) t_int,
   typeof(num) t_num,
   typeof(blb) t_blb,
   typeof(flt) t_flt
from
   T;
---
-- def   t_def    t_int    t_num    t_blb    t_flt
-- ----  -------  -------  -------  -------  -------
-- 1     integer  integer  integer  integer  real
-- 2     text     integer  integer  text     real
-- 3.3   real     real     real     real     real
-- 4.4   text     real     real     text     real
-- 5.    text     integer  integer  text     real
-- text  text     text     text     text     text
-- 007   text     integer  integer  text     real
--       null     null     null     null     null
