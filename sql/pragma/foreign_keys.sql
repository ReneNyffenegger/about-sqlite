create table parent (
  id primary key
);

create table child (
  id_parent references parent
);

-- Ok:
insert into child values (1);

begin transaction;
--
--    Pragma foreign_keys is apparently without effect in a transaction:
--
      pragma foreign_keys = on;
      insert into child values (2);
commit;

pragma foreign_keys=on;
-- 
-- Not possible, foreign keys are now enforced.
-- The following statement, if uncommented, causes
-- error message
--   Error: near line 27: FOREIGN KEY constraint failed
--
--   insert into child values (3);
