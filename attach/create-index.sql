attach database 'xyz.db' as xyz;

create table xyz.tab (a, b, c);

--
--  Note: in SQLite, when creating an index,
--  the schema name xyz is in front of the index name rather
--  than the table name:
--
create index xyz.ix on tab(a);

detach xyz;
