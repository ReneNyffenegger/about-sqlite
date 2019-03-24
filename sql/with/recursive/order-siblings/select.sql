with recursive items (lvl, id, txt, pos) as (
    select
       0     as lvl,
       id,
       txt,
       pos   as pos
    from
       item
    where
       parent is null
  union all
    select
      items.lvl + 1,
      item.id,
      item.txt,
      item.pos
    from
      items    join
      item  on items.id = item.parent
    order by
      items.lvl+1 desc,
      item.pos
)
select
   substr('_________________', 1, lvl*2) || txt
from
   items;
