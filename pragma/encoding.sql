pragma encoding;
-- UTF-8

pragma encoding='UTF-16le';
pragma encoding;
-- UTF-16le

.shell rm -f encoding.db
.open encoding.db

create table foo(a);

pragma encoding='UTF-8';

.open encoding.db
.prompt xxx
pragma encoding;
