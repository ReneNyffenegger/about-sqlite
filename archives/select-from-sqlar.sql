.header on
.mode column
.width 10 10 20 10 50

select
   name,
   printf("%o", mode),
   datetime(mtime, 'unixepoch') mtime,
   sz,
   replace(data, x'0a', '\n') data_txt
from
   sqlar;

