create table tab (
  col  text
);

insert into tab values ('abc def ghi.');
insert into tab values ('Abc Def Ghi.');
insert into tab values ('ABC DEF GHI.');

select * from tab where col like '%Def%';
-- 
-- abc def ghi.
-- Abc Def Ghi.
-- ABC DEF GHI.

select * from tab where col like '%Def%' collate binary;
--
-- abc def ghi.
-- Abc Def Ghi.
-- ABC DEF GHI.

select * from tab where col collate  binary like '%Def%' collate binary;
--
-- abc def ghi.
-- Abc Def Ghi.
-- ABC DEF GHI.


pragma case_sensitive_like = true;

select * from tab where col like '%Def%';
--
-- Abc Def Ghi.
