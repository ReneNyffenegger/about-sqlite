import sqlite3
import os.path

db_filename = 'comparison.db'

if os.path.isfile(db_filename):
   os.remove(db_filename)

db = sqlite3.connect(db_filename)

cur = db.cursor()

cur.execute('create table t (a, b)')

cur.execute("insert into t values (    1 ,    1 )")
cur.execute("insert into t values (    1 ,    2 )")
cur.execute("insert into t values ( null ,    3 )")
cur.execute("insert into t values (    4 , null )")
cur.execute("insert into t values ( null , null )")

print ("a = b")
for r in cur.execute('select * from t where a = b'):
    print ("  %d = %d" % (r[0], r[1]))
#   1 = 1


print ("nullif(a, b)")
for r in cur.execute('select nullif(a, b) from t'):
    print (r[0])
# None
# 1
# None
# 4
# None
