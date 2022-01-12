create or replace view vw_reference_cards (graphics_card_name, memory_size, memory_type) as
  select gc.graphics_card_name, gc.mem_size, mt.mem_name from graphics_card gc
  left join memory_chip mc on mc.memory_chip_id = gc.mem_id
  left join mem_type mt on mc.mem_type = mt.mem_id;
