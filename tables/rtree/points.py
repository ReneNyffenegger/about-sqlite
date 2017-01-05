import sqlite3
import os.path

db_file = 'points.db'

if os.path.isfile(db_file):
   os.remove(db_file)

db = sqlite3.connect(db_file)
db.text_factory = str
cur = db.cursor()

cur.execute('create table points      (id, x ,     y     )')
cur.execute('create table points_rtree(id, x1, x2, y1, y2)')

cur.execute('insert into points values (?,?,?)', (1,  0.5    ,  0.5    ))
cur.execute('insert into points values (?,?,?)', (2,  9.99999,  8.88888))
cur.execute('insert into points values (?,?,?)', (3, 42.42   ,  0      ))
cur.execute('insert into points values (?,?,?)', (4, 42.42   ,  8.888  ))


cur.execute('insert into points_rtree select id, x, x, y, y from points')

db.commit()

for r in cur.execute('select id from points_rtree where x1=42.42'):
    print "{:5d}".format(*r)

for r in cur.execute('select id from points_rtree where y2 between 8.8888 and 8.888888'):
    print "{:5d}".format(*r)
