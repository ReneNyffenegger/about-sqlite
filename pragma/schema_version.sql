--
--  schema_version is increased when the schema changes.
--  The version number is used to invalidate prepared statements
--

create table t_01 (
  a number
);
pragma schema_version;
--
-- 1
--

create table t_02 (
  b number
);
pragma schema_version;
--
-- 2
--

insert into t_02 values (5);
pragma schema_version;
--
-- 2
--
