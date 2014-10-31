import sqlite3
import math
import os.path

db_file = 'int-range.db'
if os.path.isfile(db_file):
   os.remove(db_file)

db = sqlite3.connect(db_file)

cur = db.cursor()

cur.execute('create table int_range(i int, ii int)')

for i in range(0, 63): # 64 would result in «OverflowError: Python int too large to convert to SQLite INTEGER»
    cur.execute ('insert into int_range values (?, ?)', ( i, 2**i))

for i in range(0, 63):
    for r in cur.execute('select ii from int_range where i = ?', (i, )):
        print math.log(r[0], 2)
