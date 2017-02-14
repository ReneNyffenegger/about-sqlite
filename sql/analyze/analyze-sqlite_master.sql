--
-- When an application changes the statistics tables directly,
-- SQLite will not immediately notice the changes.
--
-- An application can force the query planner to reread the
-- statistics tables by running

analyze sqlite_master;
