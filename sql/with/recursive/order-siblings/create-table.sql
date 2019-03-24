drop table if exists item;

create table item (
  id       integer not null primary key,
  parent   integer     null references item,
  txt      text    not null,
  pos      integer not null,
  unique(parent, pos)
);
