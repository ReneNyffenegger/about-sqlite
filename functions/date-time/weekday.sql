.mode   column
.header on

select
   date('2019-09-20', 'weekday 0') next_sunday,
   date('2019-09-20', 'weekday 1') next_monday,
   date('2019-09-20', 'weekday 2') next_tuesday,
   date('2019-09-20', 'weekday 3') next_wednesday,
   date('2019-09-20', 'weekday 4') next_thursday,
   date('2019-09-20', 'weekday 5') next_friday,
   date('2019-09-20', 'weekday 6') next_saturday;
