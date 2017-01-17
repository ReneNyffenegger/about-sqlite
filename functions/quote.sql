create table tq84_quote(t);

insert into tq84_quote values ('foo\bar');
insert into tq84_quote values ("foo\nar");
insert into tq84_quote values ('Bill O''Dill');

.mode column
.width 15 15
select t, quote(t) from tq84_quote;
--
-- foo\bar          'foo\bar'      
-- foo\nar          'foo\nar'      
-- Bill O'Dill      'Bill O''Dill' 


drop table tq84_quote;
