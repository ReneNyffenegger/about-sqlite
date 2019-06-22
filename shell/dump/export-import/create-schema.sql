create table num (
  num    integer not null primary key,
  roman  text    not null
);

create table lang (
  id     text not null primary key,
  lng    text not null
);

create table num_lang (
  id_num   integer not null references num,
  id_lang  text    not null references lang,
  txt      text    not null,
  --
  unique(id_num, id_lang)
);

create index ix_num on num(roman);

