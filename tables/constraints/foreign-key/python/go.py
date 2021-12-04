import sqlite3

db  = sqlite3.connect(':memory:')
cur = db.cursor()

print('')
print('Compile options:')
for opt in cur.execute('pragma compile_options'):
    print('  ' + opt[0])

print('')

db.execute('create table parent (id     integer primary key      , val text)')
db.execute('create table child  (parent integer references parent, val text)')

#ins_parent = db.cursor() # 'insert into parent values (?, ?)')
#ins_child  = db.cursor() # 'insert into child  values (?, ?)')

cur.executemany(
  'insert into parent values (?, ?)',
  [(1, 'foo'),
   (2, 'bar'),
   (3, 'baz')])

#
#   Uncomment following pragma
#   in order to be able to insert
#
#      (4, 'baz')
#
#   Otherwise, script throws
#      sqlite3.IntegrityError: FOREIGN KEY constraint failed
#
cur.execute('pragma foreign_keys = on')

cur.executemany(
  'insert into child values (?, ?)',
  [(2, 'two'),
   (3, 'bar'),
   (4, 'baz')])

for rec in cur.execute('select * from child'):
    print('  ' + str(rec[0]) + ': ' + rec[1])
