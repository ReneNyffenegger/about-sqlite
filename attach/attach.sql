attach database 'foo.db' as foo;

--
-- Use ».database« to show attached databases:
--
.database
-- 
-- main: 
-- foo: /home/rene/github/about/sqlite/attach/foo.db
-- 

--
-- Create table foo in persistent file foo.db:
--
create table foo.tab (a, b, c);

--
-- Detach database again:
--
detach foo;

--
-- Verify it has been detached:
--
.database
--
-- main:
--
