create table country (
   name       text,
   in_europe  integer
);

insert into country values ('Panama ', false);
insert into country values ('Egypt'  , false);
insert into country values ('Sweden' , true );
insert into country values ('Japan'  , false);
insert into country values ('Spain'  , true );

.header on
.mode   column
.width  6 9
select * from country;
--
-- name    in_europe
-- ------  ---------
-- Panama  0        
-- Egypt   0        
-- Sweden  1        
-- Japan   0        
-- Spain   1        

select name from country where in_europe;
--
-- Sweden
-- Spain

select name from country where not in_europe;
--
-- Panama
-- Egypt
-- Japan
