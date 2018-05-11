create table ri (col_1, col_2);

insert into ri values (42, 'forty-two');
select last_insert_rowid();
-- 1

insert into ri (rowid, col_1, col_2) values (17, 99, 'ninety-nine');
select last_insert_rowid();
-- 17
