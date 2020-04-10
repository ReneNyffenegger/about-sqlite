create table parent (
   id   integer primary key,
   name text
);

create table child (
   parent_id integer not null references parent,
   val       text
-- foreign key (parent_id) references parent
);

pragma foreign_keys=on;

insert into parent values (1, 'one');
insert into parent values (2, 'two');

insert into child  values (1, 'foo');
insert into child  values (2, 'bar');
insert into child  values (3, 'baz'); -- Uh, oh.
