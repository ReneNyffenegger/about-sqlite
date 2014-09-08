import sqlite3
import os.path

if os.path.isfile('datatypes.db'):
   os.remove('datatypes.db')

def sel():
   print "-----------"
   print "without_dt:"
   for r in cur.execute("select without_dt from dattyp order by without_dt"):
       print "  " + str(r[0])
   
   print "dt_num:"
   for r in cur.execute("select dt_int from dattyp order by dt_int"):
       print "  " + str(r[0])
   
   print "dt_text:"
   for r in cur.execute("select dt_text from dattyp order by dt_text"):
       print "  " + (str(r[0]))




db = sqlite3.connect('datatypes.db')

cur = db.cursor()

cur.execute('create table dattyp (without_dt, dt_int integer, dt_text text)')

cur.execute("insert into dattyp values ( 2,  2,  2)")
cur.execute("insert into dattyp values ( 9,  9,  9)")
cur.execute("insert into dattyp values (19, 19, 19)")

sel()
# without_dt:
#   2
#   9
#   19
# dt_num:
#   2
#   9
#   19
# dt_text:
#   19
#   2
#   9

cur.execute("insert into dattyp values ('28', '28', '28')")
sel()
# without_dt:
#   2
#   9
#   19
#   28
# dt_num:
#   2
#   9
#   19
#   28
# dt_text:
#   19
#   2
#   28
#   9

cur.execute("insert into dattyp values ('foo', 'bar', 'baz')")

sel()
# without_dt:
#   2
#   9
#   19
#   28
#   foo
# dt_num:
#   2
#   9
#   19
#   28
#   bar
# dt_text:
#   19
#   2
#   28
#   9
#   baz
