create table tq84_start_len (
  start_ int,
  len_  int
);

insert into tq84_start_len values ( 3,    5);
insert into tq84_start_len values ( 6,    2);
insert into tq84_start_len values ( 9,    7);
insert into tq84_start_len values ( 1,    4);
insert into tq84_start_len values ( 0,    4);
insert into tq84_start_len values (-5,    3);
insert into tq84_start_len values (-4,    3);
insert into tq84_start_len values (-3,    3);
insert into tq84_start_len values (-2,    3);
insert into tq84_start_len values ( 5,   -3);
insert into tq84_start_len values ( 5,   -4);
insert into tq84_start_len values ( 5,   -5);

create table tq84_words (
  word  text
);

insert into tq84_words values ('1234567890');

.mode  column
.width  5  7 10
select
--w.word,
  printf("  %2d", p.start_),
  printf("  %2d", p.len_  ),
  substr(w.word, p.start_, p.len_) result
from
  tq84_words     w   cross join
  tq84_start_len p;
--
--    3      5     34567     
--    6      2     67        
--    9      7     90        
--    1      4     1234      
--    0      4     123       
--   -5      3     678       
--   -4      3     789       
--   -3      3     890       
--   -2      3     90        
--    5     -3     234       
--    5     -4     1234      
--    5     -5     1234      

create table tq84_start(start_ int);
insert into tq84_start values ( 4);
insert into tq84_start values ( 1);
insert into tq84_start values ( 0);
insert into tq84_start values (-4);

.mode  column
.width  5 10

select
--w.word,
  printf("  %2d", p.start_),
  substr( w.word, p.start_) result
from
  tq84_words     w   cross join
  tq84_start     p;
--
--   4   4567890   
--   1   1234567890
--   0   1234567890
--  -4   7890      
