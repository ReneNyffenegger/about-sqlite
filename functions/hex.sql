create table h (
  col
);

insert into h values ('a');
insert into h values ('ä');
insert into h values ('foo');

.mode column
.width 3 6

select col, hex(col) from h;
-- 
-- a    61    
-- ä   C3A4          <-- c3 a4 is utf8 for ä
-- foo  666F6F
--
