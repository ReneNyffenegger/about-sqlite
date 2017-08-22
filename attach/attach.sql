attach database 'foo.db' as foo;

--
-- Create table foo in persistent file foo.db:
--
create table foo.tab (a, b, c);

detach foo;
