pragma foreign_keys = on;

insert into num      values (5, 'V'   );
insert into num      values (7, 'VII' );
insert into num      values (4, 'IV'  );
insert into num      values (2, 'II'  );
insert into num      values (9, 'IX'  );

insert into lang     values ('en', 'English');
insert into lang     values ('de', 'German' );
insert into lang     values ('fr', 'French' );

insert into num_lang values (7, 'en', 'seven' );
insert into num_lang values (7, 'de', 'sieben');
insert into num_lang values (9, 'fr', 'neuf'  );
insert into num_lang values (9, 'de', 'neue'  );
insert into num_lang values (2, 'de', 'zwei'  );

