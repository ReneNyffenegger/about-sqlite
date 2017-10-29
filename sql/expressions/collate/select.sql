create table tab (
  col_default text, -- Default: collate binary
  col_nocase  text collate nocase,
  col_etc     text
);

insert into tab values ('one', 'one', 'Etc one etc');
insert into tab values ('One', 'One', 'Etc One etc');
insert into tab values ('ONE', 'ONE', 'Etc ONE etc');
insert into tab values ('foo', 'foo', 'Etc foo etc');

.print ----
select * from tab where col_default = 'One';
-- One|One|Etc One etc

.print ----
select * from tab where col_default = 'One' collate nocase;
-- 
-- one|one|Etc one etc
-- One|One|Etc One etc
-- ONE|ONE|Etc ONE etc

.print ----
select * from tab where col_nocase = 'One';
-- 
-- one|one|Etc one etc
-- One|One|Etc One etc
-- ONE|ONE|Etc ONE etc

.print ----
select * from tab where col_nocase = 'One' collate binary;
--
-- One|One|Etc One etc

.print ----
select * from tab where col_etc like '%one%';
--
-- one|one|Etc one etc
-- One|One|Etc One etc
-- ONE|ONE|Etc ONE etc

.print ----
select * from tab where col_etc like '%one%' collate binary;
--
-- one|one|Etc one etc
-- One|One|Etc One etc
-- ONE|ONE|Etc ONE etc
