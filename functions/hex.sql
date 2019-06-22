create table h (
  col
);

insert into h values ( 'a'       );
insert into h values ( 'ä'       );
insert into h values ( 'foo'     );
insert into h values (x'deadbeef');
insert into h values (  null     );
insert into h values (  42       );
insert into h values (  9.9      );

.mode column
.width 14 10

select
   quote(col),
   hex(col)
from
   h;
--
--  'a'             61        
--  'ä'             C3A4          <-- c3 a4 is utf8 for ä
--  'foo'           666F6F    
--  X'DEADBEEF'     DEADBEEF  
--  NULL                      
--  42              3432      
--  9.9             392E39
