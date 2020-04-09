create table tab_on_conflict_abort    (id int primary key unique on conflict abort   , txt text);
create table tab_on_conflict_fail     (id int primary key unique on conflict fail    , txt text);
create table tab_on_conflict_ignore   (id int primary key unique on conflict ignore  , txt text);
create table tab_on_conflict_replace  (id int primary key unique on conflict replace , txt text);
create table tab_on_conflict_rollback (id int primary key unique on conflict rollback, txt text);

create table tab_stage (id int, txt text);

begin transaction;


insert into tab_stage values (5, 'five'        );
insert into tab_stage values (9, 'nine'        );
insert into tab_stage values (6, 'six'         );
insert into tab_stage values (4, 'four'        );
insert into tab_stage values (7, 'seven'       );
insert into tab_stage values (2, 'two'         );
insert into tab_stage values (6, 'SIX'         ) /* uh oh */;
insert into tab_stage values (1, 'one'         );
insert into tab_stage values (3, 'three'       );

commit;
begin transaction;

insert into tab_stage values (42, 'fourty-two' );
insert into tab_stage values (99, 'ninety-nine');



.print on conflict abort
.print -----------------
insert   into tab_on_conflict_abort     select * from tab_stage;
--
--       This insert statement signals an error. Because of the
--       on conflict abort clause in the primary key, no data
--       is loaded into the table at all.
--
select * from tab_on_conflict_abort;


.print on conflict fail
.print ----------------
insert   into tab_on_conflict_fail      select * from tab_stage;
--
--       This insert statement also signals an error. Because of 
--       the on conflict fail clause, the data is loaded up to (but
--       excluding) the record that caused the failure.
--
select * from tab_on_conflict_fail;
--
--  5|five
--  9|nine
--  6|six
--  4|four
--  7|seven
--  2|two


.print on conflict ignore
.print ------------------
insert   into tab_on_conflict_ignore    select * from tab_stage;
--
--       Just ignore records that would cause errors. So the
--       first record with id=6 is loaded, the second one is discared:
--
select * from tab_on_conflict_ignore;
-- 
-- 5|five
-- 9|nine
-- 6|six
-- 4|four
-- 7|seven
-- 2|two
-- 1|one
-- 3|three
-- 42|fourty-two
-- 99|ninety-nine


.print on conflict replace
.print -------------------
insert   into tab_on_conflict_replace   select * from tab_stage;
--
--       The on conflict replace clause also does not signal
--       any error. Unlike »on conflict ignore«, it overwrites
--       records with the new value, so id=6 will have txt=SIX.
--      
select * from tab_on_conflict_replace;
-- 
-- 5|five
-- 9|nine
-- 4|four
-- 7|seven
-- 2|two
-- 6|SIX
-- 1|one
-- 3|three
-- 42|fourty-two
-- 99|ninety-nine


insert   into tab_on_conflict_rollback  select * from tab_stage;
--
--       The  on conflict rollback clause signales an error AND
--       rolls back the current transaction if a duplicate
--       key is to be inserted. Hence, the inserted table will
--       remain empty.
--
select * from tab_on_conflict_rollback;

--
--       Since on conflict rollback caused a rollback,
--       the transaction was rolled back to the last commit.
--       So the records with id=42 and id=99 are not in
--       tab_stage anymore:
--
select * from tab_stage;
