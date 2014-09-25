import sqlite3
import os.path


db_file = 'foreign_key.db'
if os.path.isfile(db_file):
   os.remove(db_file)

db = sqlite3.connect(db_file)
db.text_factory = str

# Use the following pragma to enforce foreign keys!!!
# db.execute('pragma foreign_keys=on')

cur = db.cursor()

cur.execute('create table parent  (id integer primary key, t text)')
cur.execute('create table child_1 (parent_id integer not null references parent, t text)')
cur.execute('create table child_2 (parent_id integer not null, t text, foreign key (parent_id) references parent(id))')

cur.execute('insert into parent values (1, "one")')
cur.execute('insert into parent values (2, "two")')

cur.execute('insert into child_1 values (1, "ABC")')
cur.execute('insert into child_1 values (3, "DEF")') # Uh oh...

cur.execute('insert into child_2 values (1, "ABC")')
cur.execute('insert into child_2 values (3, "DEF")') # Uh oh...

db.commit()
