with recursive items (lvl, id, txt, items_pos, item_pos) as (
    select
       0    as lvl,
       id,
       txt,
       pos   as items_pos,
       0     as item_pos
    from
       item
    where
       parent is null
  union all
    select
      items.lvl + 1,
      item.id,
      item.txt,
      items.items_pos,
      item.pos        as item_pos
    from
      items    join
      item  on items.id = item.parent
    order by
      lvl desc,
--    items_pos,
      item_pos
)
select
  substr('_________________', 1, lvl*2) || txt
from
  items;
