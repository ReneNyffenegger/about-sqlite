import sqlite3
import os.path


db_file = 'aggregate_function_without_group_by.db'
if os.path.isfile(db_file):
   os.remove(db_file)

db = sqlite3.connect(db_file)
db.text_factory = str
cur = db.cursor()

cur.execute('create table t (a text, b integer)')

cur.execute('insert into t values (?, ?)', ('foo',  7))
cur.execute('insert into t values (?, ?)', ('foo',  2))
cur.execute('insert into t values (?, ?)', ('foo',  5))

cur.execute('insert into t values (?, ?)', ('bar',  3))
cur.execute('insert into t values (?, ?)', ('bar',  8))
cur.execute('insert into t values (?, ?)', ('bar',  5))
cur.execute('insert into t values (?, ?)', ('bar',  4))

cur.execute('insert into t values (?, ?)', ('baz',  4))
cur.execute('insert into t values (?, ?)', ('baz',  6))

for r in cur.execute('select a, min(b), max(b) from t'):
    print "{:4s} {:2d} {:2d}".format(*r)
    # baz   2  8
