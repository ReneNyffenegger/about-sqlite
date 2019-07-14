create table d (
   date_string text
);

insert into d values ('1970-01-01 00:00:01');
insert into d values ('1969-12-31 23:59:59');
insert into d values ('2038-01-19 03:14:07');
insert into d values ('2038-01-19 03:14:08');

create table s as
select
   date_string,
   cast(strftime('%s', date_string) as integer) as secs_since_1970_01_01
from
  d;

.mode column
.width 20 20 20 20
.header on
select
   date_string                                                               ,
   secs_since_1970_01_01                                                     ,
   printf('%x', secs_since_1970_01_01)                               secs_hex,
   strftime('%Y-%m-%d %H:%M:%S', secs_since_1970_01_01, 'unixepoch') t
from
   s;
