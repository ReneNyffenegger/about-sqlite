rm      db

sqlite3 db < create-schema.sql
sqlite3 db < insert.sql

sqlite3 db .dump > db.dump

rm      db
sqlite3 db < db.dump

sqlite3 db 'select * from num_lang'
