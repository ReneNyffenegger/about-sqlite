import sqlite3
import os.path


db_file = 'foreign-key_deferrable.db'
if os.path.isfile(db_file):
   os.remove(db_file)

db = sqlite3.connect(db_file)
db.text_factory = str

# Use the following pragma to enforce foreign keys!!!
db.execute('pragma foreign_keys=on')

cur = db.cursor()

cur.execute("""

  create table parent (
    id integer primary key,
    t  text
  )

""")

cur.execute("""

  create table child (
    parent_id integer not null 
              references parent
              deferrable initially deferred,
    t         text)
    
""")

cur.execute('insert into parent values (1, "one")')
cur.execute('insert into parent values (2, "two")')

cur.execute('insert into child  values (1, "ABC")')
cur.execute('insert into child  values (3, "DEF")') # Uh oh...

try:
  db.commit()
  print "Expected IntegrityError wasn't raised"
  
except sqlite3.IntegrityError:
  pass # Error was expected

cur.execute('insert into parent values (3, "GHI")')

db.commit()
