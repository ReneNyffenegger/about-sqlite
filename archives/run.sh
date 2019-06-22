rm archive.db

#        YYYYMMDDHHMI.SS
touch -t 201112131415.16 foo.txt
touch -t 201312111009.08 bar.txt
touch -t 201212121212.12 bar.txt

chmod    0666            foo.txt
chmod    0660            bar.txt
chmod    0600            baz.txt

sqlite3 archive.db -A -c foo.txt bar.txt baz.txt

sqlite3 archive.db -A -t

sqlite3 archive.db .schema

sqlite3 archive.db < select-from-sqlar.sql

rm foo.txt bar.txt baz.txt

sqlite3 archive.db -A -x foo.txt

ls *.txt

sqlite3 archive.db -A -x bar.txt baz.txt
